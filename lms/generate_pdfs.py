#!/usr/bin/env python3
"""Generate two professional PDFs for Ansha Montessori LMS."""

from reportlab.lib.pagesizes import A4
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.units import mm, cm
from reportlab.platypus import (
    SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle,
    PageBreak, HRFlowable, KeepTogether
)
from reportlab.lib.enums import TA_CENTER, TA_LEFT, TA_RIGHT, TA_JUSTIFY
from reportlab.platypus.flowables import Flowable
import os

# ── Colours ─────────────────────────────────────────────────────────────────
TEAL        = colors.HexColor("#1a7a7a")
TEAL_LIGHT  = colors.HexColor("#e8f5f5")
WHITE       = colors.white
BLACK       = colors.black
GREY_LINE   = colors.HexColor("#cccccc")
GREY_TEXT   = colors.HexColor("#555555")
DARK_GREY   = colors.HexColor("#333333")

OUTPUT_DIR  = r"C:\Users\Syed\Desktop\Montessori\lms"

# ── Page-level callbacks ─────────────────────────────────────────────────────
def make_page_template(canvas, doc, show_header=True):
    """Draw footer (and optional header stripe) on every page."""
    w, h = A4
    canvas.saveState()

    if show_header and doc.page > 1:
        # thin teal top bar on inner pages
        canvas.setFillColor(TEAL)
        canvas.rect(0, h - 18, w, 18, fill=1, stroke=0)
        canvas.setFillColor(WHITE)
        canvas.setFont("Helvetica-Bold", 8)
        canvas.drawString(20, h - 12, doc._doc_title)
        canvas.setFont("Helvetica", 8)
        canvas.drawRightString(w - 20, h - 12, "Ansha Montessori Teacher Training Institute")

    # footer line
    canvas.setStrokeColor(GREY_LINE)
    canvas.setLineWidth(0.5)
    canvas.line(20, 25, w - 20, 25)

    # page number
    canvas.setFillColor(GREY_TEXT)
    canvas.setFont("Helvetica", 8)
    canvas.drawCentredString(w / 2, 12, f"Page {doc.page}")

    canvas.restoreState()


# ── Style factory ────────────────────────────────────────────────────────────
def build_styles():
    base = getSampleStyleSheet()

    styles = {
        "cover_title": ParagraphStyle(
            "cover_title",
            fontName="Helvetica-Bold",
            fontSize=26,
            textColor=TEAL,
            alignment=TA_CENTER,
            spaceAfter=8,
            leading=32,
        ),
        "cover_subtitle": ParagraphStyle(
            "cover_subtitle",
            fontName="Helvetica",
            fontSize=14,
            textColor=DARK_GREY,
            alignment=TA_CENTER,
            spaceAfter=6,
        ),
        "cover_date": ParagraphStyle(
            "cover_date",
            fontName="Helvetica",
            fontSize=11,
            textColor=GREY_TEXT,
            alignment=TA_CENTER,
        ),
        "section_heading": ParagraphStyle(
            "section_heading",
            fontName="Helvetica-Bold",
            fontSize=14,
            textColor=WHITE,
            backColor=TEAL,
            alignment=TA_LEFT,
            spaceBefore=14,
            spaceAfter=8,
            leftIndent=-4,
            rightIndent=-4,
            borderPad=6,
        ),
        "sub_heading": ParagraphStyle(
            "sub_heading",
            fontName="Helvetica-Bold",
            fontSize=11,
            textColor=TEAL,
            spaceBefore=10,
            spaceAfter=4,
        ),
        "body": ParagraphStyle(
            "body",
            fontName="Helvetica",
            fontSize=10,
            textColor=BLACK,
            leading=15,
            spaceAfter=4,
            alignment=TA_JUSTIFY,
        ),
        "bullet": ParagraphStyle(
            "bullet",
            fontName="Helvetica",
            fontSize=10,
            textColor=BLACK,
            leading=14,
            spaceAfter=3,
            leftIndent=16,
            bulletIndent=4,
        ),
        "toc_title": ParagraphStyle(
            "toc_title",
            fontName="Helvetica-Bold",
            fontSize=15,
            textColor=TEAL,
            alignment=TA_CENTER,
            spaceAfter=14,
        ),
        "toc_entry": ParagraphStyle(
            "toc_entry",
            fontName="Helvetica",
            fontSize=10,
            textColor=BLACK,
            leading=18,
            leftIndent=12,
        ),
        "toc_section": ParagraphStyle(
            "toc_section",
            fontName="Helvetica-Bold",
            fontSize=11,
            textColor=TEAL,
            leading=20,
        ),
        "note": ParagraphStyle(
            "note",
            fontName="Helvetica-Oblique",
            fontSize=9,
            textColor=GREY_TEXT,
            leading=13,
            spaceAfter=4,
            leftIndent=12,
        ),
        "logo": ParagraphStyle(
            "logo",
            fontName="Helvetica-Bold",
            fontSize=38,
            textColor=TEAL,
            alignment=TA_CENTER,
            spaceAfter=4,
        ),
    }
    return styles


# ── Cover page helper ────────────────────────────────────────────────────────
def cover_page(story, s, title_line1, title_line2, subtitle, date_str):
    """Build a cover page."""
    story.append(Spacer(1, 50))
    story.append(Paragraph("Ansha Montessori", s["logo"]))
    story.append(Paragraph("Teacher Training Institute", s["cover_subtitle"]))
    story.append(Spacer(1, 30))

    # decorative line
    story.append(HRFlowable(width="80%", thickness=2, color=TEAL, spaceAfter=20))

    story.append(Paragraph(title_line1, s["cover_title"]))
    if title_line2:
        story.append(Paragraph(title_line2, s["cover_title"]))
    story.append(Spacer(1, 12))
    story.append(Paragraph(subtitle, s["cover_subtitle"]))
    story.append(Spacer(1, 8))
    story.append(Paragraph(date_str, s["cover_date"]))
    story.append(HRFlowable(width="80%", thickness=2, color=TEAL, spaceBefore=20, spaceAfter=20))
    story.append(PageBreak())


# ── TOC helper ───────────────────────────────────────────────────────────────
def toc_page(story, s, entries):
    """entries: list of (section_label, title, sub_entries=[...]) """
    story.append(Paragraph("Table of Contents", s["toc_title"]))
    story.append(HRFlowable(width="100%", thickness=1, color=TEAL, spaceAfter=10))

    for label, title, subs in entries:
        story.append(Paragraph(f"{label}  {title}", s["toc_section"]))
        for sub in subs:
            story.append(Paragraph(f"\u2022  {sub}", s["toc_entry"]))

    story.append(PageBreak())


# ── Section header helper ────────────────────────────────────────────────────
def sec_header(story, s, text):
    # teal box via paragraph backColor
    story.append(Spacer(1, 6))
    story.append(Paragraph(f"  {text}", s["section_heading"]))
    story.append(Spacer(1, 4))


def sub_header(story, s, text):
    story.append(Paragraph(text, s["sub_heading"]))


def body(story, s, text):
    story.append(Paragraph(text, s["body"]))


def bullet(story, s, items):
    for item in items:
        story.append(Paragraph(f"\u2022  {item}", s["bullet"]))


def note(story, s, text):
    story.append(Paragraph(f"Note: {text}", s["note"]))


# ════════════════════════════════════════════════════════════════════════════
#  PDF 1 — LMS User Guide
# ════════════════════════════════════════════════════════════════════════════
def build_user_guide():
    path = os.path.join(OUTPUT_DIR, "Ansha_Montessori_LMS_User_Guide.pdf")
    doc = SimpleDocTemplate(
        path,
        pagesize=A4,
        rightMargin=2.2*cm, leftMargin=2.2*cm,
        topMargin=2.8*cm, bottomMargin=2.2*cm,
    )
    doc._doc_title = "LMS User Guide"

    s = build_styles()
    story = []

    # ── Cover ────────────────────────────────────────────────────────────────
    cover_page(
        story, s,
        "LMS User Guide",
        None,
        "Complete Guide for Admins, Teachers &amp; Students",
        "March 2026",
    )

    # ── TOC ──────────────────────────────────────────────────────────────────
    toc_entries = [
        ("Section 1", "Getting Started", ["Login URL", "Username & Password format"]),
        ("Section 2", "Admin Guide", [
            "Dashboard", "Student Information", "Admission", "Teachers",
            "Courses", "Lessons & PDFs", "Exam Results", "Payment",
            "Expenses", "Profit & Loss", "Reports", "Backup & Restore", "Announcements",
        ]),
        ("Section 3", "Teacher Guide", [
            "Dashboard", "My Courses", "Lessons", "Quizzes", "Assignments",
        ]),
        ("Section 4", "Student Guide", [
            "Dashboard", "Browse Courses", "My Courses",
            "Assignments", "My Results", "Profile & Certificates",
        ]),
        ("Section 5", "Tips & FAQs", ["Browser recommendations", "Data storage", "Support"]),
    ]
    toc_page(story, s, toc_entries)

    # ── Section 1: Getting Started ───────────────────────────────────────────
    sec_header(story, s, "Section 1 — Getting Started")
    body(story, s,
         "The Ansha Montessori LMS is accessible from any modern web browser. "
         "No installation is required. All data is stored securely in the cloud.")
    story.append(Spacer(1, 6))

    sub_header(story, s, "Login URL")
    body(story, s, "https://radiant-naiad-98e62b.netlify.app/lms/")
    note(story, s, "Use Google Chrome or Microsoft Edge for the best experience.")

    sub_header(story, s, "Username & Password — Students")
    body(story, s,
         "Student usernames follow the format: <b>firstname_last4digits</b> of their registered "
         "mobile number. For example, a student named Priya whose phone ends in 4095 would log in as:")
    bullet(story, s, [
        "Username:  priya_4095",
        "Password:  last 8 digits of the registered mobile number",
    ])

    sub_header(story, s, "Username & Password — Teachers & Admins")
    body(story, s,
         "Teachers and Admins use their individually assigned usernames and passwords "
         "provided by the institute administrator.")

    story.append(PageBreak())

    # ── Section 2: Admin Guide ───────────────────────────────────────────────
    sec_header(story, s, "Section 2 — Admin Guide")
    body(story, s,
         "The Admin role has full access to all LMS modules. The navigation sidebar "
         "on the left provides quick access to each module described below.")

    sub_header(story, s, "Dashboard")
    bullet(story, s, [
        "View summary cards: Total Students, Active Courses, Total Enrollments, Revenue (INR).",
        "Post announcements visible to all users.",
        "Monitor at-a-glance metrics for the current batch.",
    ])

    sub_header(story, s, "Student Information")
    bullet(story, s, [
        "View the complete list of enrolled students.",
        "Search by name, course, or phone number.",
        "Filter by course to view course-specific rosters.",
        "Export student data via Reports.",
    ])

    sub_header(story, s, "Admission")
    bullet(story, s, [
        "Add a new student by entering their name, phone number, email, address, and course.",
        "The system auto-generates login credentials upon saving.",
        "Assign the student to one or more courses.",
        "Set the fee amount and payment plan.",
    ])

    sub_header(story, s, "Teachers")
    bullet(story, s, [
        "Add new teacher accounts with name, email, and assigned courses.",
        "Edit or deactivate existing teacher accounts.",
        "View which courses each teacher is managing.",
    ])

    sub_header(story, s, "Courses")
    body(story, s, "The LMS supports four courses offered by the institute:")
    data = [
        ["Course Name", "Fee (INR)"],
        ["Advance Montessori", "₹15,000"],
        ["Spoken English", "₹8,000"],
        ["Phonics", "₹6,000"],
        ["Child Psychology", "₹10,000"],
    ]
    t = Table(data, colWidths=[9*cm, 5*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [TEAL_LIGHT, WHITE]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("ALIGN",      (1, 0), (1, -1), "CENTER"),
        ("TOPPADDING", (0, 0), (-1, -1), 5),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 5),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
    ]))
    story.append(Spacer(1, 4))
    story.append(t)
    story.append(Spacer(1, 8))

    sub_header(story, s, "Lessons & PDFs")
    bullet(story, s, [
        "Upload PDF study materials for each course.",
        "Add video lesson links (YouTube or any URL).",
        "Organise materials by chapter or module.",
        "Students can view PDFs and watch videos from My Courses.",
    ])

    sub_header(story, s, "Exam Results")
    bullet(story, s, [
        "Enter exam scores for individual students.",
        "View consolidated results per course.",
        "Results are visible to students in their portal.",
    ])

    sub_header(story, s, "Payment")
    bullet(story, s, [
        "Record fee payments received from students.",
        "View full payment history per student.",
        "Mark instalments as paid.",
        "See total collected, balance pending, and overdue amounts.",
    ])

    sub_header(story, s, "Expenses")
    bullet(story, s, [
        "Log institute expenses: rent, salaries, utilities, supplies, etc.",
        "Categorise expenses by type and date.",
        "View monthly and annual expense summaries.",
    ])

    sub_header(story, s, "Profit & Loss")
    bullet(story, s, [
        "View a consolidated financial summary.",
        "Income (fees collected) vs Expenses breakdown.",
        "Net profit or loss displayed with INR formatting.",
    ])

    sub_header(story, s, "Reports")
    bullet(story, s, [
        "Generate student enrolment reports.",
        "Generate fee collection and pending balance reports.",
        "Export reports as printable pages.",
    ])

    sub_header(story, s, "Backup & Restore")
    bullet(story, s, [
        "Export all LMS data (students, courses, payments, results) as a JSON file.",
        "Import a previously exported JSON backup to restore data.",
        "Recommended: take a backup before major data changes.",
    ])

    sub_header(story, s, "Announcements")
    bullet(story, s, [
        "Post announcements from the Admin Dashboard.",
        "Announcements are visible to all Teachers and Students on their dashboards.",
        "Edit or delete announcements at any time.",
    ])

    story.append(PageBreak())

    # ── Section 3: Teacher Guide ─────────────────────────────────────────────
    sec_header(story, s, "Section 3 — Teacher Guide")
    body(story, s,
         "Teachers have access to course management, learning materials, quizzes, and "
         "assignments for the courses assigned to them.")

    sub_header(story, s, "Dashboard")
    bullet(story, s, [
        "View assigned courses and the number of enrolled students.",
        "See recent student activity and announcements from Admin.",
    ])

    sub_header(story, s, "My Courses")
    bullet(story, s, [
        "See the list of students enrolled in each assigned course.",
        "View individual student progress.",
    ])

    sub_header(story, s, "Lessons")
    bullet(story, s, [
        "Upload PDF study materials for your courses.",
        "Add video lesson links.",
        "Organise content by topic or chapter.",
    ])

    sub_header(story, s, "Quizzes")
    bullet(story, s, [
        "Create multiple-choice or short-answer quizzes.",
        "Assign quizzes to a specific course.",
        "View student quiz submissions and scores.",
    ])

    sub_header(story, s, "Assignments")
    bullet(story, s, [
        "Post assignment questions with deadlines.",
        "Students submit answers through their portal.",
        "Grade submitted assignments and provide feedback.",
    ])

    story.append(PageBreak())

    # ── Section 4: Student Guide ─────────────────────────────────────────────
    sec_header(story, s, "Section 4 — Student Guide")
    body(story, s,
         "Students can access their enrolled courses, study materials, quizzes, "
         "assignments, and results through the Student Portal.")

    sub_header(story, s, "Dashboard")
    bullet(story, s, [
        "View your enrolled courses and overall progress.",
        "See recent announcements from the institute.",
        "Quick links to continue where you left off.",
    ])

    sub_header(story, s, "Browse Courses")
    bullet(story, s, [
        "Explore all courses offered by Ansha Montessori Institute.",
        "View course descriptions and fee information.",
        "Contact the admin to enrol in additional courses.",
    ])

    sub_header(story, s, "My Courses")
    bullet(story, s, [
        "Access lessons and PDF materials for your enrolled courses.",
        "Watch video lessons uploaded by your teacher.",
        "Attempt quizzes assigned by the teacher.",
    ])

    sub_header(story, s, "Assignments")
    bullet(story, s, [
        "View pending assignments with their deadlines.",
        "Submit your assignment answers online.",
        "Check graded assignments and teacher feedback.",
    ])

    sub_header(story, s, "My Results")
    bullet(story, s, [
        "View your exam results and scores.",
        "See a breakdown of marks per subject or module.",
    ])

    sub_header(story, s, "Profile & Certificates")
    bullet(story, s, [
        "View your profile information.",
        "Download your course completion certificate (when issued by admin).",
    ])

    story.append(PageBreak())

    # ── Section 5: Tips & FAQs ───────────────────────────────────────────────
    sec_header(story, s, "Section 5 — Tips &amp; FAQs")

    sub_header(story, s, "Browser Recommendation")
    body(story, s,
         "Use <b>Google Chrome</b> or <b>Microsoft Edge</b> for the best experience. "
         "Safari and Firefox are also supported but Chrome/Edge is preferred.")

    sub_header(story, s, "Data Storage")
    body(story, s,
         "All LMS data is automatically saved to the cloud using <b>Supabase</b> "
         "(a secure PostgreSQL database). You do not need to manually save anything. "
         "Changes take effect immediately.")

    sub_header(story, s, "Forgotten Password / Login Issues")
    bullet(story, s, [
        "Students: your password is the last 8 digits of your registered mobile number.",
        "Teachers & Admins: contact the institute administrator to reset your password.",
        "If the page does not load, check your internet connection and try refreshing.",
    ])

    sub_header(story, s, "Frequently Asked Questions")
    faq_data = [
        ["Q: Can I access the LMS on my phone?",
         "A: Yes. The LMS is mobile-responsive and works on smartphones and tablets."],
        ["Q: Is my data secure?",
         "A: Yes. Data is stored on Supabase (PostgreSQL) with secure cloud hosting."],
        ["Q: Who do I contact for support?",
         "A: Contact the Ansha Montessori admin team at the institute."],
        ["Q: Can I change my password?",
         "A: Password changes are managed by the Admin. Contact admin to update."],
        ["Q: How do I know if my fee is paid?",
         "A: Students can see their payment status in their profile. "
          "Contact the admin for queries."],
    ]
    for q, a in faq_data:
        story.append(Paragraph(q, s["sub_heading"]))
        story.append(Paragraph(a, s["body"]))

    story.append(Spacer(1, 20))
    story.append(HRFlowable(width="100%", thickness=1, color=TEAL))
    story.append(Spacer(1, 6))
    story.append(Paragraph(
        "Ansha Montessori Teacher Training Institute — LMS User Guide — March 2026",
        s["note"],
    ))

    # Build
    doc.build(story, onFirstPage=make_page_template, onLaterPages=make_page_template)
    return path


# ════════════════════════════════════════════════════════════════════════════
#  PDF 2 — Tech Build Summary
# ════════════════════════════════════════════════════════════════════════════
def build_tech_summary():
    path = os.path.join(OUTPUT_DIR, "Ansha_Montessori_Tech_Build_Summary.pdf")
    doc = SimpleDocTemplate(
        path,
        pagesize=A4,
        rightMargin=2.2*cm, leftMargin=2.2*cm,
        topMargin=2.8*cm, bottomMargin=2.2*cm,
    )
    doc._doc_title = "Tech Build Summary"

    s = build_styles()
    story = []

    # ── Cover ────────────────────────────────────────────────────────────────
    cover_page(
        story, s,
        "LMS — Tech Build Summary",
        None,
        "Development Overview &amp; Technical Architecture",
        "March 2026",
    )

    # ── TOC ──────────────────────────────────────────────────────────────────
    toc_entries = [
        ("Section 1", "Project Overview", ["Client", "Purpose", "Batch & Enrolment"]),
        ("Section 2", "Technology Stack", [
            "Frontend", "Database", "Authentication", "Hosting & Source Control",
        ]),
        ("Section 3", "Features Built", [
            "Admin pages (12)", "Teacher pages (5)", "Student pages (6)",
            "Supabase sync", "Financial features",
        ]),
        ("Section 4", "Data Imported", [
            "Student enrolments", "Course breakdown", "Fee summary",
        ]),
        ("Section 5", "Development Effort", ["Hour breakdown", "Total effort"]),
        ("Section 6", "Deployment", ["Live URL", "CI/CD pipeline", "Database tier"]),
    ]
    toc_page(story, s, toc_entries)

    # ── Section 1: Project Overview ──────────────────────────────────────────
    sec_header(story, s, "Section 1 — Project Overview")

    overview_data = [
        ["Field", "Details"],
        ["Client", "Ansha Montessori Teacher Training Institute"],
        ["Purpose", "Full-featured Learning Management System (LMS)"],
        ["Batch", "2026 Batch"],
        ["Total Students", "117 enrolments (114 unique students)"],
        ["Courses", "4 courses"],
        ["Live URL", "https://radiant-naiad-98e62b.netlify.app/lms/"],
    ]
    t = Table(overview_data, colWidths=[5*cm, 11*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, 1), (0, -1), "Helvetica-Bold"),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [TEAL_LIGHT, WHITE]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
        ("VALIGN",     (0, 0), (-1, -1), "TOP"),
    ]))
    story.append(t)
    story.append(PageBreak())

    # ── Section 2: Technology Stack ──────────────────────────────────────────
    sec_header(story, s, "Section 2 — Technology Stack")

    tech_data = [
        ["Layer", "Technology / Detail"],
        ["Frontend", "HTML5, CSS3, Vanilla JavaScript (no frameworks)"],
        ["Database", "Supabase (PostgreSQL) — cloud-hosted, free tier"],
        ["Authentication",
         "Custom session-based auth via localStorage with Supabase sync"],
        ["Hosting", "Netlify — auto-deploy from GitHub push"],
        ["Source Control", "GitHub (meeranpmo-svg/lms)"],
        ["Icons / UI", "Font Awesome 6, Emoji avatars"],
        ["Build Tools", "None — static files, no bundler or transpiler"],
    ]
    t = Table(tech_data, colWidths=[4.5*cm, 11.5*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, 1), (0, -1), "Helvetica-Bold"),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [TEAL_LIGHT, WHITE]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
        ("VALIGN",     (0, 0), (-1, -1), "TOP"),
    ]))
    story.append(t)
    story.append(PageBreak())

    # ── Section 3: Features Built ────────────────────────────────────────────
    sec_header(story, s, "Section 3 — Features Built")

    sub_header(story, s, "Admin Pages (12)")
    bullet(story, s, [
        "Dashboard — summary metrics, announcements",
        "Student Information — full student roster with search & filter",
        "Admission — add new students, assign courses, set fees",
        "Teachers — add and manage teacher accounts",
        "Courses — create and edit the four courses",
        "Lessons & PDFs — upload study materials and video links",
        "Exam Results — enter and view student scores",
        "Payment — record fee payments, view history, mark paid",
        "Expenses — log institute expenses by category",
        "Profit & Loss — income vs expense financial summary",
        "Reports — student and financial report generation",
        "Backup & Restore — export/import all data as JSON",
    ])

    sub_header(story, s, "Teacher Pages (5)")
    bullet(story, s, [
        "Dashboard — assigned courses and student progress overview",
        "My Courses — enrolled students per course",
        "Lessons — upload and manage learning materials",
        "Quizzes — create and manage quizzes",
        "Assignments — post assignments and grade submissions",
    ])

    sub_header(story, s, "Student Pages (6)")
    bullet(story, s, [
        "Dashboard — enrolled courses and progress",
        "Browse Courses — all available courses",
        "My Courses — access lessons, PDFs, and quizzes",
        "Assignments — view and submit assignments",
        "My Results — exam results and grades",
        "Profile & Certificates — profile info and certificate download",
    ])

    sub_header(story, s, "Key Technical Features")
    bullet(story, s, [
        "Supabase real-time sync for all data across pages",
        "INR currency formatting throughout the UI",
        "Fee tracking: Total Fee vs Collected vs Balance Pending",
        "Announcement system from Admin to all users",
        "Data export and import via JSON backup/restore",
        "Responsive layout — works on desktop, tablet, and mobile",
        "Auto-generated student login credentials on admission",
    ])

    story.append(PageBreak())

    # ── Section 4: Data Imported ─────────────────────────────────────────────
    sec_header(story, s, "Section 4 — Data Imported")

    sub_header(story, s, "Student Enrolments")
    bullet(story, s, [
        "117 total enrolments (114 unique students — some enrolled in multiple courses)",
        "3 teachers and 3 admin accounts",
    ])

    sub_header(story, s, "Course Breakdown")
    course_data = [
        ["Course", "Enrolled Students", "Fee per Student"],
        ["Advance Montessori", "91", "₹15,000"],
        ["Child Psychology",   "11", "₹10,000"],
        ["Phonics",            "12",  "₹6,000"],
        ["Spoken English",      "3",  "₹8,000"],
        ["Total",             "117",         "—"],
    ]
    t = Table(course_data, colWidths=[7*cm, 5*cm, 4*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, -1), (-1, -1), "Helvetica-Bold"),
        ("BACKGROUND", (0, -1), (-1, -1), TEAL_LIGHT),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -2), [WHITE, TEAL_LIGHT]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("ALIGN",      (1, 0), (-1, -1), "CENTER"),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
    ]))
    story.append(Spacer(1, 4))
    story.append(t)
    story.append(Spacer(1, 10))

    sub_header(story, s, "Fee Summary")
    fee_data = [
        ["Metric", "Amount (INR)"],
        ["Total Fee Charged",   "₹19,13,500"],
        ["Total Collected",      "₹5,39,000"],
        ["Balance Pending",     "₹13,74,500"],
    ]
    t = Table(fee_data, colWidths=[9*cm, 7*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, 1), (0, -1), "Helvetica-Bold"),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [TEAL_LIGHT, WHITE]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("ALIGN",      (1, 0), (1, -1), "RIGHT"),
        ("TOPPADDING", (0, 0), (-1, -1), 7),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 7),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
        ("RIGHTPADDING", (0, 0), (-1, -1), 10),
    ]))
    story.append(t)
    story.append(PageBreak())

    # ── Section 5: Development Effort ───────────────────────────────────────
    sec_header(story, s, "Section 5 — Development Effort")

    effort_data = [
        ["Task", "Hours"],
        ["Planning & Analysis", "2"],
        ["Database Schema & Supabase Setup", "3"],
        ["Frontend Development (all pages)", "8"],
        ["Data Import (SQL scripts for 117 students)", "3"],
        ["Bug Fixes & Sync Issues", "2"],
        ["Fee Correction & INR Migration", "1"],
        ["Credential Excel Generation", "1"],
        ["Total Estimated Effort", "~20"],
    ]
    t = Table(effort_data, colWidths=[12*cm, 4*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, -1), (-1, -1), "Helvetica-Bold"),
        ("BACKGROUND", (0, -1), (-1, -1), TEAL_LIGHT),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -2), [WHITE, TEAL_LIGHT]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("ALIGN",      (1, 0), (1, -1), "CENTER"),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
    ]))
    story.append(t)
    story.append(Spacer(1, 10))

    body(story, s,
         "Built using <b>Claude Code</b> (AI-assisted development) — "
         "enabling rapid, high-quality delivery of a full-stack LMS in approximately 20 hours.")

    story.append(PageBreak())

    # ── Section 6: Deployment ────────────────────────────────────────────────
    sec_header(story, s, "Section 6 — Deployment")

    deploy_data = [
        ["Item", "Details"],
        ["Live URL",
         "https://radiant-naiad-98e62b.netlify.app/lms/"],
        ["Custom Domain (pending)", "lms.anshamontessori.com"],
        ["Auto-deploy",
         "GitHub push → Netlify build in ~30 seconds"],
        ["Database",
         "Supabase free tier — 500 MB storage, 50,000 row limit"],
        ["Source Repo", "github.com/meeranpmo-svg/lms"],
        ["Build Process",
         "No build step — static HTML/CSS/JS served directly"],
    ]
    t = Table(deploy_data, colWidths=[4.5*cm, 11.5*cm])
    t.setStyle(TableStyle([
        ("BACKGROUND", (0, 0), (-1, 0), TEAL),
        ("TEXTCOLOR",  (0, 0), (-1, 0), WHITE),
        ("FONTNAME",   (0, 0), (-1, 0), "Helvetica-Bold"),
        ("FONTNAME",   (0, 1), (0, -1), "Helvetica-Bold"),
        ("FONTSIZE",   (0, 0), (-1, -1), 10),
        ("ROWBACKGROUNDS", (0, 1), (-1, -1), [TEAL_LIGHT, WHITE]),
        ("GRID",       (0, 0), (-1, -1), 0.4, GREY_LINE),
        ("TOPPADDING", (0, 0), (-1, -1), 6),
        ("BOTTOMPADDING", (0, 0), (-1, -1), 6),
        ("LEFTPADDING",  (0, 0), (-1, -1), 8),
        ("VALIGN",     (0, 0), (-1, -1), "TOP"),
    ]))
    story.append(t)
    story.append(Spacer(1, 20))

    story.append(HRFlowable(width="100%", thickness=1, color=TEAL))
    story.append(Spacer(1, 6))
    story.append(Paragraph(
        "Ansha Montessori LMS — Tech Build Summary — March 2026 — "
        "Built with Claude Code (AI-assisted development)",
        s["note"],
    ))

    # Build
    doc.build(story, onFirstPage=make_page_template, onLaterPages=make_page_template)
    return path


# ── Main ─────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    import sys

    print("Generating PDFs...")

    p1 = build_user_guide()
    size1 = os.path.getsize(p1)
    print(f"[OK] {p1}  ({size1:,} bytes / {size1/1024:.1f} KB)")

    p2 = build_tech_summary()
    size2 = os.path.getsize(p2)
    print(f"[OK] {p2}  ({size2:,} bytes / {size2/1024:.1f} KB)")

    print("\nBoth PDFs generated successfully.")
