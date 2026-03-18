# 🌟 Ansha Shine Kids School — ERP + LMS

Complete school management platform for **Ansha Shine Kids School**, a kindergarten chain in Chennai, Tamil Nadu.

[![Build & Publish Docker Images](https://github.com/khemala041-hub/Ansha/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/khemala041-hub/Ansha/actions/workflows/docker-publish.yml)

---

## 📦 What's Inside

| System | Port | Description |
|--------|------|-------------|
| **ERP** | `8081` | School management: attendance, payroll, fees, CCTV, transport |
| **LMS** | `3000` | Learning management: courses, lessons, quizzes, results |

---

## 🚀 Quick Start with Docker

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running
- [Git](https://git-scm.com/)

### 1. Clone the repository
```bash
git clone https://github.com/khemala041-hub/Ansha.git
cd Ansha
```

### 2. Start all services
```bash
docker compose up -d
```

### 3. Open in browser
- **ERP:** http://localhost:8081
- **LMS:** http://localhost:3000

### 4. Stop all services
```bash
docker compose down
```

---

## 🔑 Login Credentials

### ERP (http://localhost:8081)

| Role | Email | Password |
|------|-------|----------|
| Super Admin | superadmin@anshashinekidsschool.com | admin123 |
| Branch Admin (Anna Nagar) | annanagar@anshashinekidsschool.com | admin123 |
| Branch Admin (T. Nagar) | tnagar@anshashinekidsschool.com | admin123 |

### LMS (http://localhost:3000)

| Role | Email | Password |
|------|-------|----------|
| Admin | admin@ansha.edu | admin123 |
| Teacher | teacher@ansha.edu | teacher123 |
| Student | student@ansha.edu | student123 |

---

## 🏫 ERP Modules

| Module | Description |
|--------|-------------|
| 📊 Dashboard | Live stats, charts, branch overview |
| 🏫 Branch Management | 10 branches, expansion to 50 |
| 👧 Students | Admission, profiles, filter by program |
| 📋 Admissions | 5-step admission form with auto-ID |
| ✅ Attendance | Student + Staff attendance with monthly reports |
| 👩‍🏫 Staff Management | Staff profiles, roles, HR records |
| 💰 Payroll | Salary breakdown, DA/HRA/PF/ESI, payslips |
| 🧾 Fees Collection | Fee receipts, defaulter list, collection % |
| 📈 Finance | Income & expenses ledger, profit/loss |
| 🚌 Transport | Routes, stops, occupancy, drivers |
| 📹 CCTV Monitor | 12 camera feeds, activity log |
| 📚 Programs | Day Care, Nursery, PreKG, LKG, UKG, Summer Camp, After School |
| 💾 Backup & Restore | Export/import ERP data, integrity check |

---

## 🎓 LMS Modules

| Module | Description |
|--------|-------------|
| 📚 Courses | Curriculum management per program |
| 📖 Lessons | Lesson plans, materials, multimedia |
| 📝 Quizzes | Interactive assessments |
| 📋 Assignments | Task management with submissions |
| 📊 Results | Grade reports, progress tracking |
| 💰 Fees | Fee collection & payment status |
| 💾 Backup & Restore | Export/import LMS data |

---

## 🐳 Docker Commands Reference

```bash
# Start all services in background
docker compose up -d

# Start with live logs
docker compose up

# Stop all services
docker compose down

# Rebuild images after code changes
docker compose up -d --build

# Check container status
docker compose ps

# View logs
docker compose logs -f

# View ERP logs only
docker compose logs -f erp

# Restart a single service
docker compose restart erp

# Pull latest images from ghcr.io
docker compose pull
docker compose up -d
```

---

## ☁️ Pull from GitHub Container Registry

After each push to `main`, Docker images are automatically built and published:

```bash
# Pull latest images
docker pull ghcr.io/khemala041-hub/ansha-erp:latest
docker pull ghcr.io/khemala041-hub/ansha-lms:latest

# Run directly
docker run -d -p 8081:80 ghcr.io/khemala041-hub/ansha-erp:latest
docker run -d -p 3000:80  ghcr.io/khemala041-hub/ansha-lms:latest
```

---

## 💾 Backup & Restore

### Browser-based backup (ERP)
1. Login to ERP → **Backup & Restore** in sidebar
2. Click **Download Full Backup** → saves `.json` file
3. To restore: drag & drop the `.json` file → click **Restore**

### Automated server backup
```bash
# Manual backup
./backup.sh

# Schedule daily at 6 PM (cron)
crontab -e
# Add: 0 18 * * * /path/to/Ansha/backup.sh --quiet >> /var/log/ansha-backup.log 2>&1
```

### Restore from archive
```bash
./restore.sh ./backups/ansha-full-backup-2026-03-18_18-00-00.tar.gz
```

---

## 🏗️ Project Structure

```
Ansha/
├── erp/                        # School ERP system
│   ├── index.html              # Login page
│   ├── dashboard.html          # Main dashboard
│   ├── students.html           # Student management
│   ├── admission.html          # 5-step admission form
│   ├── attendance.html         # Attendance tracking
│   ├── staff.html              # Staff management
│   ├── payroll.html            # Payroll processing
│   ├── fees.html               # Fees collection
│   ├── finance.html            # Income & expenses
│   ├── cctv.html               # CCTV monitoring
│   ├── transport.html          # Transport management
│   ├── branches.html           # Branch management
│   ├── programs.html           # Programs & curriculum
│   ├── backup.html             # Backup & restore
│   ├── assets/
│   │   ├── css/style.css       # Main stylesheet
│   │   └── js/
│   │       ├── data.js         # Sample data & helpers
│   │       ├── auth.js         # Authentication
│   │       └── utils.js        # Sidebar, utilities
│   ├── Dockerfile              # ERP container
│   └── nginx.conf              # nginx config
├── lms/                        # Learning Management System
│   ├── index.html              # Login page
│   ├── admin/                  # Admin portal
│   ├── teacher/                # Teacher portal
│   ├── student/                # Student portal
│   ├── assets/
│   ├── Dockerfile              # LMS container
│   └── nginx.conf              # nginx config
├── docker-compose.yml          # Orchestrate ERP + LMS
├── backup.sh                   # Automated backup script
├── restore.sh                  # Restore from backup
├── .github/
│   └── workflows/
│       └── docker-publish.yml  # CI/CD → ghcr.io
└── README.md
```

---

## 🌐 Branches

| Branch | Location | Phone |
|--------|----------|-------|
| Anna Nagar | No 9, 9th Ave, Anna Nagar | 044-26289090 |
| T. Nagar | 7A, Thyagaraya Rd, T. Nagar | 044-24357878 |
| Velachery | Plot 12, 100 Feet Rd, Velachery | 044-22592929 |
| Kodambakkam | 23, Arcot Rd, Kodambakkam | 044-24742929 |
| Adyar | 14, LB Rd, Adyar | 044-24415151 |
| Nungambakkam | 45, Nungambakkam High Rd | 044-28221212 |
| Mylapore | 8, TTK Rd, Mylapore | 044-24984545 |
| Porur | 110, GST Rd, Porur | — |
| Tambaram East | 55, Tambaram East Main Rd | — |
| Chromepet | 32, GST Rd, Chromepet | — |

---

## 📋 Programs Offered

- 🍼 **Day Care** — 6 months – 2 years
- 🧸 **Nursery** — 2 – 3 years
- 🎨 **Pre-KG** — 3 – 4 years
- 📖 **LKG** — 4 – 5 years
- 🎓 **UKG** — 5 – 6 years
- ☀️ **Summer Camp** — May – June (all ages)
- 🌟 **After School Activities** — Art, Music, Dance, Sports, Chess

---

*Built with ❤️ for Ansha Shine Kids School, Chennai*
