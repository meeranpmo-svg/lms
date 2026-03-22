/* =========================================================
   ANSHA MONTESSORI LMS — SUPABASE.JS
   Supabase client + async helpers + write-through sync
   ========================================================= */

const SUPA_URL = 'https://twzcefikdychhsjwjekf.supabase.co';
const SUPA_KEY = 'sb_publishable_GijBRmulhuyIp3bigyhMUw_hVmQiB0y';
const _sb = window.supabase.createClient(SUPA_URL, SUPA_KEY);

/* ── Login ──────────────────────────────────────────────── */
async function sbLogin(credential, password, role) {
  const isEmail = credential.includes('@');
  let q = _sb.from('users').select('*')
    .eq('password', password)
    .eq('role', role)
    .eq('is_active', true);
  q = isEmail ? q.eq('email', credential) : q.eq('username', credential);
  const { data, error } = await q.maybeSingle();
  if (error || !data) return { success: false, message: 'Invalid credentials or role.' };
  const user = {
    id: data.id, name: data.name, email: data.email || '',
    username: data.username, role: data.role, avatar: data.avatar || '👩‍🎓'
  };
  setSession(user);
  sbSyncToLocal(data.id, role).catch(console.error);
  return { success: true, user };
}

/* ── Sync Supabase → localStorage after login ───────────── */
async function sbSyncToLocal(userId, role) {
  if (role === 'student') {
    const [{ data: enr }, { data: prog }, { data: subs }, { data: fees }] = await Promise.all([
      _sb.from('enrollments').select('*').eq('student_id', userId),
      _sb.from('progress').select('*').eq('student_id', userId),
      _sb.from('submissions').select('*').eq('student_id', userId),
      _sb.from('fees').select('*').eq('student_id', userId)
    ]);
    if (enr)  dbSet(DB.ENROLLMENTS, enr.map(_enrToLocal));
    if (prog) dbSet(DB.PROGRESS,    prog.map(_progToLocal));
    if (subs) dbSet(DB.SUBMISSIONS, subs.map(_subToLocal));
    if (fees) dbSet(DB.PAYMENTS,    fees.map(_feeToLocal));
  }

  if (role === 'admin') {
    const [{ data: students }, { data: teachers }, { data: enr }, { data: fees }, { data: exp }] = await Promise.all([
      _sb.from('users').select('*').eq('role', 'student'),
      _sb.from('users').select('*').eq('role', 'teacher'),
      _sb.from('enrollments').select('*'),
      _sb.from('fees').select('*'),
      _sb.from('expenses').select('*')
    ]);
    const admins  = dbGet(DB.USERS).filter(u => u.role === 'admin');
    const allUsers = [
      ...admins,
      ...(students || []).map(_userToLocal),
      ...(teachers || []).map(_userToLocal)
    ];
    dbSet(DB.USERS, allUsers);
    if (enr) dbSet(DB.ENROLLMENTS, enr.map(_enrToLocal));
    if (fees) dbSet(DB.PAYMENTS,   fees.map(_feeToLocal));
    if (exp)  dbSet(DB.EXPENSES,   exp.map(_expToLocal));
  }

  if (role === 'teacher') {
    const [{ data: subs }, { data: enr }, { data: students }] = await Promise.all([
      _sb.from('submissions').select('*'),
      _sb.from('enrollments').select('*'),
      _sb.from('users').select('*').eq('role', 'student')
    ]);
    if (subs)     dbSet(DB.SUBMISSIONS, subs.map(_subToLocal));
    if (enr)      dbSet(DB.ENROLLMENTS, enr.map(_enrToLocal));
    if (students) {
      const others = dbGet(DB.USERS).filter(u => u.role !== 'student');
      dbSet(DB.USERS, [...others, ...students.map(_userToLocal)]);
    }
  }
}

/* ── Data mappers ────────────────────────────────────────── */
function _userToLocal(u) {
  return {
    id: u.id, name: u.name, email: u.email || '', username: u.username,
    password: u.password, role: u.role, avatar: u.avatar || '👩‍🎓',
    phone: u.phone || '', dob: u.dob || '', gender: u.gender || '',
    cnic: u.cnic || '', address: u.address || '',
    fatherName: u.fathers_name || '', createdAt: u.created_at
  };
}
function _enrToLocal(e) {
  return {
    id: e.id, studentId: e.student_id, courseId: e.course_id,
    enrolledAt: e.enrolled_at, progress: e.progress || 0,
    status: e.status || 'active', feeStatus: e.fee_status || 'pending'
  };
}
function _progToLocal(p) {
  return { id: p.id, studentId: p.student_id, lessonId: p.lesson_id, completed: p.completed, completedAt: p.completed_at };
}
function _subToLocal(s) {
  return {
    id: s.id, type: s.type, studentId: s.student_id,
    quizId: s.quiz_id, assignmentId: s.assignment_id,
    score: s.score, total: s.total, percentage: s.percentage,
    answers: s.answers, answer: s.answer, marks: s.marks,
    feedback: s.feedback, submittedAt: s.submitted_at, gradedAt: s.graded_at
  };
}
function _feeToLocal(f) {
  return {
    id: f.id, studentId: f.student_id, courseId: f.course_id,
    amount: f.amount, dueDate: f.due_date, paidDate: f.paid_date,
    status: f.status, description: f.description, createdAt: f.created_at
  };
}
function _expToLocal(e) {
  return { id: e.id, category: e.category, amount: e.amount, description: e.description, date: e.date, createdAt: e.created_at };
}

/* ── Write-through: called fire-and-forget from data.js ─── */
function sbPushEnrollment(e) {
  _sb.from('enrollments').upsert({
    id: e.id, student_id: e.studentId, course_id: e.courseId,
    progress: e.progress || 0, status: e.status || 'active',
    fee_status: e.feeStatus || 'pending'
  }, { onConflict: 'id' }).catch(console.error);
}

function sbPushProgress(p) {
  _sb.from('progress').upsert({
    id: p.id, student_id: p.studentId, lesson_id: p.lessonId,
    completed: p.completed, completed_at: p.completedAt
  }, { onConflict: 'student_id,lesson_id' }).catch(console.error);
}

function sbPushSubmission(s) {
  _sb.from('submissions').upsert({
    id: s.id, type: s.type, student_id: s.studentId,
    quiz_id: s.quizId || null, assignment_id: s.assignmentId || null,
    score: s.score ?? null, total: s.total ?? null, percentage: s.percentage ?? null,
    answers: s.answers || null, answer: s.answer || null,
    marks: s.marks ?? null, feedback: s.feedback || null,
    submitted_at: s.submittedAt, graded_at: s.gradedAt || null
  }, { onConflict: 'id' }).catch(console.error);
}

function sbPushFee(f) {
  _sb.from('fees').upsert({
    id: f.id, student_id: f.studentId, course_id: f.courseId || null,
    amount: f.amount, due_date: f.dueDate || null,
    paid_date: f.paidDate || null, status: f.status || 'pending',
    description: f.description || null
  }, { onConflict: 'id' }).catch(console.error);
}

function sbPushExpense(e) {
  _sb.from('expenses').upsert({
    id: e.id, category: e.category, amount: e.amount,
    description: e.description || null,
    date: e.date || new Date().toISOString().split('T')[0]
  }, { onConflict: 'id' }).catch(console.error);
}

/* ── Create student account in Supabase ─────────────────── */
async function sbCreateStudent(student) {
  const { data, error } = await _sb.from('users').insert({
    name: student.name,
    fathers_name: student.fatherName || null,
    email: student.email || null,
    username: student.username,
    password: student.password,
    role: 'student',
    avatar: student.avatar || '👩‍🎓',
    phone: student.phone || null,
    dob: student.dob || null,
    gender: student.gender || null,
    cnic: student.cnic || null,
    address: student.address || null,
    is_active: true
  }).select().maybeSingle();
  return { data, error };
}

/* ── Fetch all students (admin use) ─────────────────────── */
async function sbGetStudents() {
  const { data } = await _sb.from('users').select('*').eq('role', 'student').eq('is_active', true).order('name');
  return (data || []).map(_userToLocal);
}
