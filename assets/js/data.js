/* ================================================================
   ANSHA SHINE KIDS SCHOOL — ERP DATA LAYER
   All sample data and data access functions
   ================================================================ */

/* ---------- BRANCHES ---------- */
const BRANCHES = [
  { id:'B001', name:'Tambaram West',  addr:'No# 1A, Sundaram Colony 3rd St, Near Anchaneyar Kovil, Tambaram West, Chennai 600 045', phone:'860 861 2233', email:'tambaram@anshashinekidsschool.com',  adminId:'U002', status:'active',  est:'2015', students:82, staff:12 },
  { id:'B002', name:'Mudichur',       addr:'Dhanalaxmi St, South Laxmi Nager, Opp Nayara Petrol Bunk, Chennai 600 048',             phone:'984 172 6893', email:'mudichur@anshashinekidsschool.com',   adminId:'U003', status:'active',  est:'2017', students:64, staff:9  },
  { id:'B003', name:'Padapai',        addr:'Ozur Amman Kovil St, Athencherry, Opp. Annai Sagaya Mary Church, Padapai 601 301',       phone:'936 771 2344', email:'padappai@anshashinekidsschool.com',   adminId:'U004', status:'active',  est:'2018', students:55, staff:8  },
  { id:'B004', name:'Pallavakkam',    addr:'Periyar Nager Junction, Pallavakam, Chennai 600 041',                                    phone:'944 492 1124', email:'pallavakam@anshashinekidsschool.com',  adminId:'U005', status:'active',  est:'2019', students:70, staff:10 },
  { id:'B005', name:'Mannivakkam',    addr:'Shanmuga Nagar, Mannivakkam, Chennai 600 048',                                           phone:'843 811 1248', email:'mannivakkam@anshashinekidsschool.com', adminId:'U006', status:'active',  est:'2019', students:58, staff:8  },
  { id:'B006', name:'Kanathur',       addr:'ECR Main Road, Kanathur, Chennai 603 112',                                               phone:'98842 81223',  email:'kanathur@anshashinekidsschool.com',    adminId:'U007', status:'active',  est:'2020', students:47, staff:7  },
  { id:'B007', name:'Mappedu',        addr:'Near Mappedu Bus Stop, Mappedu, Thiruvallur 602 105',                                    phone:'90031 44556',  email:'mappedu@anshashinekidsschool.com',     adminId:'U008', status:'active',  est:'2021', students:43, staff:6  },
  { id:'B008', name:'Porur',          addr:'Arcot Road, Porur, Chennai 600 116',                                                     phone:'99401 22334',  email:'porur@anshashinekidsschool.com',       adminId:null,   status:'setup',  est:'2024', students:28, staff:5  },
  { id:'B009', name:'Tambaram East',  addr:'GST Road, Tambaram East, Chennai 600 059',                                               phone:'',             email:'',                                     adminId:null,   status:'setup',  est:'2024', students:32, staff:5  },
  { id:'B010', name:'Chromepet',      addr:'Chromepet Main Road, Chennai 600 044',                                                   phone:'',             email:'',                                     adminId:null,   status:'planned',est:'2025', students:0,  staff:0  },
];

/* ---------- PROGRAMS ---------- */
const PROGRAMS = [
  { id:'PR01', code:'DC',  name:'Day Care',          ageGroup:'6 months – 3 yrs', duration:'Full Day (8am–6pm)',  monthlyFee:2500, color:'#7D3C98', icon:'🍼' },
  { id:'PR02', code:'NUR', name:'Nursery',            ageGroup:'2.5 – 3.5 yrs',  duration:'Half / Full Day',     monthlyFee:3000, color:'#E65100', icon:'🌱' },
  { id:'PR03', code:'PKG', name:'Pre KG',             ageGroup:'3.5 – 4.5 yrs',  duration:'Full Day (8am–1pm)', monthlyFee:3500, color:'#1565C0', icon:'📚' },
  { id:'PR04', code:'LKG', name:'LKG',                ageGroup:'4.5 – 5.5 yrs',  duration:'Full Day (8am–1pm)', monthlyFee:4000, color:'#1A7A4A', icon:'🎨' },
  { id:'PR05', code:'UKG', name:'UKG',                ageGroup:'5.5 – 6.5 yrs',  duration:'Full Day (8am–1pm)', monthlyFee:4500, color:'#B7950B', icon:'⭐' },
  { id:'PR06', code:'SC',  name:'Summer Camp',        ageGroup:'3 – 8 yrs',      duration:'May–June (4 wks)',    monthlyFee:5000, color:'#C62828', icon:'☀️' },
  { id:'PR07', code:'AS',  name:'After School Care',  ageGroup:'5 – 10 yrs',     duration:'3pm – 6pm',          monthlyFee:2000, color:'#00838F', icon:'🏃' },
];

/* ---------- USERS / ADMINS ---------- */
const USERS = [
  { id:'U001', name:'Super Admin',    email:'admin@anshashinekidsschool.com',    pass:'Admin@123',   role:'superadmin', branchId:null,  phone:'860 861 2200', avatar:'SA' },
  { id:'U002', name:'Priya Devi',     email:'tambaram@anshashinekidsschool.com', pass:'Branch@123',  role:'admin',      branchId:'B001', phone:'860 861 2233', avatar:'PD' },
  { id:'U003', name:'Kavitha Rajan',  email:'mudichur@anshashinekidsschool.com', pass:'Branch@123',  role:'admin',      branchId:'B002', phone:'984 172 6893', avatar:'KR' },
  { id:'U004', name:'Sunita Kumari',  email:'padappai@anshashinekidsschool.com', pass:'Branch@123',  role:'admin',      branchId:'B003', phone:'936 771 2344', avatar:'SK' },
  { id:'U005', name:'Meena Lakshmi',  email:'pallavakam@anshashinekidsschool.com',pass:'Branch@123', role:'admin',      branchId:'B004', phone:'944 492 1124', avatar:'ML' },
  { id:'U006', name:'Radha Mani',     email:'mannivakkam@anshashinekidsschool.com',pass:'Branch@123',role:'admin',      branchId:'B005', phone:'843 811 1248', avatar:'RM' },
  { id:'U007', name:'Sujatha Nair',   email:'kanathur@anshashinekidsschool.com', pass:'Branch@123',  role:'admin',      branchId:'B006', phone:'98842 81223',  avatar:'SN' },
  { id:'U008', name:'Anitha Bose',    email:'mappedu@anshashinekidsschool.com',  pass:'Branch@123',  role:'admin',      branchId:'B007', phone:'90031 44556',  avatar:'AB' },
];

/* ---------- STAFF (sample for B001) ---------- */
const STAFF = [
  { id:'S001', branchId:'B001', name:'Fatima Begum',    role:'Head Teacher',    dept:'Academic', prog:'PKG,LKG,UKG', phone:'98401 11001', email:'fatima@asksb001.com', join:'2015-06-01', salary:22000, status:'active', gender:'F', att:'P' },
  { id:'S002', branchId:'B001', name:'Deepa Rajan',     role:'Teacher',         dept:'Academic', prog:'NUR,PKG',      phone:'98401 11002', email:'deepa@asksb001.com',  join:'2016-08-15', salary:18000, status:'active', gender:'F', att:'P' },
  { id:'S003', branchId:'B001', name:'Shalini Mohan',   role:'Teacher',         dept:'Academic', prog:'LKG,UKG',      phone:'98401 11003', email:'shalini@asksb001.com',join:'2017-04-01', salary:18000, status:'active', gender:'F', att:'P' },
  { id:'S004', branchId:'B001', name:'Preethi Raj',     role:'Assistant Teacher',dept:'Academic',prog:'DC,NUR',       phone:'98401 11004', email:'preethi@asksb001.com',join:'2018-07-20', salary:15000, status:'active', gender:'F', att:'L' },
  { id:'S005', branchId:'B001', name:'Nirmala Devi',    role:'Caretaker',       dept:'Daycare',  prog:'DC',           phone:'98401 11005', email:'nirmala@asksb001.com',join:'2019-01-10', salary:14000, status:'active', gender:'F', att:'P' },
  { id:'S006', branchId:'B001', name:'Geetha Krishnan', role:'Caretaker',       dept:'Daycare',  prog:'DC',           phone:'98401 11006', email:'geetha@asksb001.com', join:'2020-03-05', salary:14000, status:'active', gender:'F', att:'P' },
  { id:'S007', branchId:'B001', name:'Murugesan T',     role:'Driver',          dept:'Transport',prog:'-',            phone:'98401 11007', email:'murugesan@asksb001.com',join:'2016-01-15',salary:16000, status:'active', gender:'M', att:'P' },
  { id:'S008', branchId:'B001', name:'Selvam K',        role:'Driver',          dept:'Transport',prog:'-',            phone:'98401 11008', email:'selvam@asksb001.com', join:'2017-09-01', salary:15000, status:'active', gender:'M', att:'A' },
  { id:'S009', branchId:'B001', name:'Ramesh Babu',     role:'Security Guard',  dept:'Security', prog:'-',            phone:'98401 11009', email:'ramesh@asksb001.com', join:'2018-02-20', salary:13000, status:'active', gender:'M', att:'P' },
  { id:'S010', branchId:'B001', name:'Vijayalakshmi P', role:'Admin Clerk',     dept:'Admin',    prog:'-',            phone:'98401 11010', email:'vijaya@asksb001.com', join:'2019-05-12', salary:14000, status:'active', gender:'F', att:'P' },
  { id:'S011', branchId:'B001', name:'Karthik Selvan',  role:'IT Support',      dept:'Tech',     prog:'-',            phone:'98401 11011', email:'karthik@asksb001.com',join:'2021-11-01', salary:20000, status:'active', gender:'M', att:'P' },
  { id:'S012', branchId:'B001', name:'Anbu Malar',      role:'Cook / Ayah',     dept:'Support',  prog:'DC',           phone:'98401 11012', email:'anbu@asksb001.com',   join:'2020-08-15', salary:12000, status:'active', gender:'F', att:'P' },

  { id:'S013', branchId:'B002', name:'Lakshmi Priya',   role:'Head Teacher',    dept:'Academic', prog:'LKG,UKG',      phone:'98401 22001', email:'lakshmi@asksb002.com',join:'2017-06-01', salary:22000, status:'active', gender:'F', att:'P' },
  { id:'S014', branchId:'B002', name:'Chitra Devi',     role:'Teacher',         dept:'Academic', prog:'NUR,PKG',      phone:'98401 22002', email:'chitra@asksb002.com', join:'2018-03-10', salary:18000, status:'active', gender:'F', att:'P' },
  { id:'S015', branchId:'B002', name:'Parvathi S',      role:'Teacher',         dept:'Academic', prog:'DC,NUR',       phone:'98401 22003', email:'parvathi@asksb002.com',join:'2019-09-15',salary:17000, status:'active', gender:'F', att:'A' },

  { id:'S016', branchId:'B003', name:'Indira Devi',     role:'Head Teacher',    dept:'Academic', prog:'PKG,LKG',      phone:'98401 33001', email:'indira@asksb003.com', join:'2018-06-01', salary:21000, status:'active', gender:'F', att:'P' },
  { id:'S017', branchId:'B004', name:'Saranya Balaji',  role:'Head Teacher',    dept:'Academic', prog:'LKG,UKG',      phone:'98401 44001', email:'saranya@asksb004.com',join:'2019-06-01', salary:21000, status:'active', gender:'F', att:'P' },
  { id:'S018', branchId:'B005', name:'Padmini Raj',     role:'Head Teacher',    dept:'Academic', prog:'NUR,PKG',      phone:'98401 55001', email:'padmini@asksb005.com',join:'2019-07-01', salary:20000, status:'active', gender:'F', att:'P' },
];

/* ---------- STUDENTS (sample — 30 for B001, brief for others) ---------- */
const generateStudents = () => {
  const names = [
    ['Aadhi','M'],['Priya','F'],['Arjun','M'],['Divya','F'],['Kiran','M'],
    ['Meera','F'],['Rajan','M'],['Ananya','F'],['Vikram','M'],['Kavya','F'],
    ['Surya','M'],['Nithya','F'],['Harish','M'],['Sindhu','F'],['Suresh','M'],
    ['Geetha','F'],['Arun','M'],['Uma','F'],['Balaji','M'],['Sridevi','F'],
    ['Naveen','M'],['Rekha','F'],['Mithun','M'],['Lavanya','F'],['Dinesh','M'],
    ['Swetha','F'],['Praveen','M'],['Saritha','F'],['Gopal','M'],['Prema','F'],
  ];
  const surnames = ['Kumar','Devi','Rajan','Krishnan','Balu','Mohan','Raj','Mani','Selvan','Babu'];
  const programs = ['DC','NUR','PKG','LKG','UKG'];
  const bloodGroups = ['A+','B+','O+','AB+','A-','B-'];
  const routes = ['R001','R002','R003','R004'];
  const students = [];
  let sid = 1;

  BRANCHES.forEach(branch => {
    const count = branch.students || 10;
    for (let i = 0; i < Math.min(count, 30); i++) {
      const [firstName, gender] = names[i % names.length];
      const surname = surnames[Math.floor(i / names.length) % surnames.length];
      const prog = programs[i % programs.length];
      const progData = PROGRAMS.find(p => p.code === prog);
      const admDate = `202${Math.floor(i/10)+1}-06-${String((i%28)+1).padStart(2,'0')}`;
      students.push({
        id: `ST${String(sid).padStart(4,'0')}`,
        branchId: branch.id,
        admNo: `ASKS/${branch.id}/${String(2021+Math.floor(i/10))}-${String(i%100).padStart(2,'0')}`,
        name: `${firstName} ${surname}`,
        gender, dob: `201${8-Math.floor(prog==='DC'?0:['DC','NUR','PKG','LKG','UKG'].indexOf(prog))}-0${(i%9)+1}-${String((i%28)+1).padStart(2,'0')}`,
        program: prog, programName: progData?.name || prog,
        section: ['A','B','C'][i % 3],
        bloodGroup: bloodGroups[i % bloodGroups.length],
        parentName: `${surnames[i % surnames.length]} ${['Raj','Kumar','Devi','Mani'][i%4]}`,
        parentPhone: `9${String(6000000000 + sid).slice(1)}`,
        parentEmail: `parent${sid}@example.com`,
        address: `No.${(i+1)*3}, ${['Rose','Jasmine','Lotus','Lily'][i%4]} Street, Chennai`,
        admDate, status:'active',
        monthlyFee: progData?.monthlyFee || 3000,
        transport: i % 3 === 0 ? routes[i % routes.length] : null,
        feeStatus: ['paid','paid','partial','pending','paid'][i % 5],
        photoInit: firstName[0] + surname[0],
      });
      sid++;
    }
  });
  return students;
};

const STUDENTS = generateStudents();

/* ---------- TRANSPORT ---------- */
const TRANSPORT_ROUTES = [
  { id:'R001', branchId:'B001', name:'Tambaram – Perungalathur Route', vehicle:'TN 01 AB 1234', driver:'S007', driverName:'Murugesan T', capacity:20, students:15, stops:[
    { name:'Tambaram Bus Stand',  time:'07:30', pickup:true },
    { name:'Perungalathur X',     time:'07:45', pickup:true },
    { name:'GST Road Junction',   time:'07:55', pickup:true },
    { name:'Ansha Shine School',  time:'08:15', pickup:false },
  ]},
  { id:'R002', branchId:'B001', name:'Mudichur – Mannivakkam Route', vehicle:'TN 01 CD 5678', driver:'S008', driverName:'Selvam K', capacity:18, students:14, stops:[
    { name:'Mudichur Stop',       time:'07:25', pickup:true },
    { name:'South Laxmi Nager',   time:'07:35', pickup:true },
    { name:'Mannivakkam X',       time:'07:50', pickup:true },
    { name:'Ansha Shine School',  time:'08:15', pickup:false },
  ]},
  { id:'R003', branchId:'B001', name:'Velachery – Pallavakkam Route', vehicle:'TN 01 EF 9012', driver:null, driverName:'Ravi K (Contract)', capacity:22, students:16, stops:[
    { name:'Velachery Signal',    time:'07:20', pickup:true },
    { name:'Pallavakkam Jn',      time:'07:40', pickup:true },
    { name:'ECR Cross',           time:'07:55', pickup:true },
    { name:'Ansha Shine School',  time:'08:15', pickup:false },
  ]},
  { id:'R004', branchId:'B001', name:'Padapai – Vandalur Route', vehicle:'TN 01 GH 3456', driver:null, driverName:'Senthil M (Contract)', capacity:20, students:12, stops:[
    { name:'Padapai Junction',    time:'07:30', pickup:true },
    { name:'Vandalur Zoo Gate',   time:'07:45', pickup:true },
    { name:'Urapakkam Signal',    time:'07:58', pickup:true },
    { name:'Ansha Shine School',  time:'08:15', pickup:false },
  ]},
];

/* ---------- FEES (current month) ---------- */
const CURRENT_MONTH = '2026-03';
const FEE_RECORDS = [];
(function generateFees() {
  const b001Students = STUDENTS.filter(s => s.branchId === 'B001');
  b001Students.forEach((s, i) => {
    const statuses = ['paid','paid','paid','partial','pending'];
    const status = statuses[i % 5];
    const total = s.monthlyFee + (s.transport ? 800 : 0);
    const paid = status === 'paid' ? total : status === 'partial' ? Math.floor(total * 0.5) : 0;
    FEE_RECORDS.push({
      id: `F${String(i+1).padStart(4,'0')}`,
      studentId: s.id,
      studentName: s.name,
      branchId: 'B001',
      month: CURRENT_MONTH,
      program: s.program,
      tuitionFee: s.monthlyFee,
      transportFee: s.transport ? 800 : 0,
      totalFee: total,
      paidAmount: paid,
      balance: total - paid,
      status,
      paidDate: status !== 'pending' ? `2026-03-${String((i % 15)+1).padStart(2,'0')}` : null,
      payMode: ['Cash','UPI','Bank Transfer'][i % 3],
      receiptNo: status !== 'pending' ? `RCP-2026-${String(1000+i)}` : null,
    });
  });
})();

/* ---------- FINANCE / LEDGER ---------- */
const LEDGER = [
  { id:'L001', branchId:'B001', date:'2026-03-01', type:'income',  category:'Fees',         desc:'March Fees Collection',          amount:125000, ref:'BATCH-MAR-001' },
  { id:'L002', branchId:'B001', date:'2026-03-02', type:'expense', category:'Salaries',     desc:'March Salary Advance',           amount:45000,  ref:'SAL-ADV-001' },
  { id:'L003', branchId:'B001', date:'2026-03-04', type:'income',  category:'Fees',         desc:'March Fees – Batch 2',           amount:82000,  ref:'BATCH-MAR-002' },
  { id:'L004', branchId:'B001', date:'2026-03-05', type:'expense', category:'Utilities',    desc:'Electricity Bill – February',    amount:8500,   ref:'UTIL-001' },
  { id:'L005', branchId:'B001', date:'2026-03-06', type:'expense', category:'Supplies',     desc:'Stationery & Art Supplies',      amount:12000,  ref:'SUPP-001' },
  { id:'L006', branchId:'B001', date:'2026-03-07', type:'income',  category:'Transport',    desc:'Transport Fees – March',         amount:18400,  ref:'TRANS-MAR-001' },
  { id:'L007', branchId:'B001', date:'2026-03-08', type:'expense', category:'Maintenance',  desc:'Classroom Furniture Repair',     amount:6500,   ref:'MAINT-001' },
  { id:'L008', branchId:'B001', date:'2026-03-10', type:'expense', category:'Food',         desc:'Tiffin & Meals – Week 1',        amount:9000,   ref:'FOOD-001' },
  { id:'L009', branchId:'B001', date:'2026-03-12', type:'income',  category:'Miscellaneous',desc:'Activity Fee – Summer Camp Reg', amount:15000,  ref:'SC-REG-001' },
  { id:'L010', branchId:'B001', date:'2026-03-14', type:'expense', category:'Salaries',     desc:'Contract Staff Payment',         amount:14000,  ref:'SAL-CNT-001' },
  { id:'L011', branchId:'B001', date:'2026-03-15', type:'expense', category:'Rent',         desc:'Building Rent – March',          amount:35000,  ref:'RENT-MAR-001' },
  { id:'L012', branchId:'B001', date:'2026-03-15', type:'income',  category:'Fees',         desc:'March Fees – Batch 3',           amount:55000,  ref:'BATCH-MAR-003' },
  { id:'L013', branchId:'B001', date:'2026-03-16', type:'expense', category:'Utilities',    desc:'Internet & Phone Bill',          amount:2800,   ref:'UTIL-002' },
  { id:'L014', branchId:'B001', date:'2026-03-17', type:'expense', category:'Supplies',     desc:'Classroom Decoration – Spring',  amount:4500,   ref:'SUPP-002' },
];

/* ---------- CCTV CAMERAS ---------- */
const CCTV_CAMERAS = [
  { id:'CAM01', branchId:'B001', name:'Main Entrance',    location:'Gate',          status:'online',  resolution:'1080p', icon:'🚪' },
  { id:'CAM02', branchId:'B001', name:'Nursery Room',     location:'Classroom-1',   status:'online',  resolution:'1080p', icon:'🍼' },
  { id:'CAM03', branchId:'B001', name:'PreKG Classroom',  location:'Classroom-2',   status:'online',  resolution:'1080p', icon:'📚' },
  { id:'CAM04', branchId:'B001', name:'LKG Classroom',    location:'Classroom-3',   status:'online',  resolution:'720p',  icon:'🎨' },
  { id:'CAM05', branchId:'B001', name:'UKG Classroom',    location:'Classroom-4',   status:'online',  resolution:'720p',  icon:'⭐' },
  { id:'CAM06', branchId:'B001', name:'Day Care Room',    location:'Daycare',        status:'online',  resolution:'1080p', icon:'🛏️' },
  { id:'CAM07', branchId:'B001', name:'Play Area',        location:'Outdoor',        status:'online',  resolution:'720p',  icon:'🛝' },
  { id:'CAM08', branchId:'B001', name:'Cafeteria',        location:'Ground Floor',   status:'offline', resolution:'720p',  icon:'🍽️' },
  { id:'CAM09', branchId:'B001', name:'Corridor North',   location:'1st Floor',      status:'online',  resolution:'720p',  icon:'🚶' },
  { id:'CAM10', branchId:'B001', name:'Admin Office',     location:'Office',         status:'online',  resolution:'1080p', icon:'🖥️' },
  { id:'CAM11', branchId:'B001', name:'Parking Lot',      location:'Exterior',       status:'online',  resolution:'720p',  icon:'🚗' },
  { id:'CAM12', branchId:'B001', name:'After School Room',location:'Classroom-5',    status:'offline', resolution:'1080p', icon:'🏃' },
];

/* ---------- ATTENDANCE DATA (today) ---------- */
const TODAY = new Date().toISOString().split('T')[0];
const ATTENDANCE_DATA = {};
(function buildAttendance() {
  STUDENTS.filter(s => s.branchId === 'B001').forEach(s => {
    const r = Math.random();
    ATTENDANCE_DATA[s.id] = r > 0.12 ? 'P' : r > 0.05 ? 'A' : 'L';
  });
})();

/* ---------- HELPER FUNCTIONS ---------- */
function getBranchById(id) { return BRANCHES.find(b => b.id === id); }
function getUserByEmail(email) { return USERS.find(u => u.email === email); }
function getStudentsByBranch(bid) { return STUDENTS.filter(s => s.branchId === bid); }
function getStaffByBranch(bid) { return STAFF.filter(s => s.branchId === bid); }
function getProgramByCode(code) { return PROGRAMS.find(p => p.code === code); }
function getFeesByBranch(bid) { return FEE_RECORDS.filter(f => f.branchId === bid); }
function getLedgerByBranch(bid) { return LEDGER.filter(l => l.branchId === bid); }
function getCamerasByBranch(bid) { return CCTV_CAMERAS.filter(c => c.branchId === bid); }
function getRoutesByBranch(bid) { return TRANSPORT_ROUTES.filter(r => r.branchId === bid); }

function currencyINR(n) {
  return '₹' + Number(n).toLocaleString('en-IN');
}
function fmtDate(d) {
  if (!d) return '–';
  const dt = new Date(d);
  return dt.toLocaleDateString('en-IN', { day:'2-digit', month:'short', year:'numeric' });
}
function fmtAge(dob) {
  if (!dob) return '–';
  const today = new Date();
  const birth = new Date(dob);
  let y = today.getFullYear() - birth.getFullYear();
  let m = today.getMonth() - birth.getMonth();
  if (m < 0) { y--; m += 12; }
  return `${y}y ${m}m`;
}

/* Persist override attendance in localStorage */
function saveAttendance(studentId, status) {
  const key = `att_${TODAY}`;
  const stored = JSON.parse(localStorage.getItem(key) || '{}');
  stored[studentId] = status;
  localStorage.setItem(key, JSON.stringify(stored));
}
function getTodayAttendance() {
  const key = `att_${TODAY}`;
  const stored = JSON.parse(localStorage.getItem(key) || '{}');
  return { ...ATTENDANCE_DATA, ...stored };
}

/* Summary stats */
function getBranchSummary(branchId) {
  const students = getStudentsByBranch(branchId);
  const staff = getStaffByBranch(branchId);
  const fees = getFeesByBranch(branchId);
  const todayAtt = getTodayAttendance();
  const presentToday = Object.values(todayAtt).filter(v => v === 'P').length;
  const totalFees = fees.reduce((a,f) => a + f.totalFee, 0);
  const collectedFees = fees.reduce((a,f) => a + f.paidAmount, 0);

  return { students: students.length, staff: staff.length, presentToday, totalFees, collectedFees, pendingFees: totalFees - collectedFees };
}

function getAllBranchesSummary() {
  return {
    totalBranches: BRANCHES.filter(b => b.status === 'active').length,
    totalStudents: BRANCHES.reduce((a,b) => a + (b.students||0), 0),
    totalStaff: BRANCHES.reduce((a,b) => a + (b.staff||0), 0),
    activeBranches: BRANCHES.filter(b => b.status === 'active').length,
    setupBranches: BRANCHES.filter(b => b.status === 'setup').length,
    plannedBranches: BRANCHES.filter(b => b.status === 'planned').length,
  };
}
