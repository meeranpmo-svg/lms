/* =========================================================
   ANSHA MONTESSORI LMS — AUTH.JS
   Authentication & authorization helpers
   ========================================================= */

// Legacy sync login (localStorage fallback)
function login(email, password, role) {
  const user = findUserByEmail(email);
  if (!user) return { success: false, message: 'No account found with this email address.' };
  if (user.password !== password) return { success: false, message: 'Incorrect password. Please try again.' };
  if (user.role !== role) return { success: false, message: `This account is registered as a ${user.role}, not a ${role}.` };
  setSession(user);
  return { success: true, user };
}

// Primary async login — checks Supabase first, falls back to localStorage
async function loginAsync(credential, password, role) {
  try {
    const result = await sbLogin(credential, password, role);
    return result;
  } catch (e) {
    // Fallback to localStorage if Supabase unreachable
    return login(credential, password, role);
  }
}

function logout() {
  clearSession();
  window.location.href = rootPath() + 'index.html';
}

function requireAuth(role) {
  const user = getSession();
  if (!user) { window.location.href = rootPath() + 'index.html'; return null; }
  if (role && user.role !== role) { window.location.href = rootPath() + 'index.html'; return null; }
  return user;
}

function rootPath() {
  const path = window.location.pathname;
  if (path.includes('/admin/') || path.includes('/teacher/') || path.includes('/student/')) return '../';
  return '';
}

function redirectAfterLogin(role) {
  if (role === 'admin')        window.location.href = 'admin/dashboard.html';
  else if (role === 'teacher') window.location.href = 'teacher/dashboard.html';
  else                         window.location.href = 'student/dashboard.html';
}

function getInitials(name) {
  if (!name) return '?';
  return name.split(' ').map(w => w[0]).join('').toUpperCase().slice(0, 2);
}
