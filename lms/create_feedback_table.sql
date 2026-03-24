-- ============================================================
-- ANSHA MONTESSORI LMS — Feedback Table
-- Run this in Supabase → SQL Editor
-- ============================================================

CREATE TABLE IF NOT EXISTS feedback (
  id              uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  student_name    text NOT NULL,
  whatsapp        text NOT NULL,
  email           text,
  course          text NOT NULL,
  date_of_join    date,
  fees_paid       integer DEFAULT 0,
  fees_pending    integer DEFAULT 0,
  session_preference text,
  rating          integer CHECK (rating BETWEEN 1 AND 5),
  feedback        text NOT NULL,
  suggestions     text,
  submitted_at    timestamptz DEFAULT now()
);

-- Allow anyone to INSERT (public form, no login required)
ALTER TABLE feedback ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public can insert feedback"
  ON feedback FOR INSERT
  TO anon
  WITH CHECK (true);

CREATE POLICY "Admins can read feedback"
  ON feedback FOR SELECT
  TO anon
  USING (true);

-- Verify
SELECT COUNT(*) AS total_feedback FROM feedback;
