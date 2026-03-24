-- ============================================================
-- ANSHA MONTESSORI LMS — Webinar Tables
-- Run this in Supabase → SQL Editor
-- ============================================================

-- Webinar Registrations
CREATE TABLE IF NOT EXISTS webinar_registrations (
  id            uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name          text NOT NULL,
  whatsapp      text NOT NULL,
  gender        text,
  webinar       text,
  registered_at timestamptz DEFAULT now()
);

-- Webinar Feedback (post-webinar)
CREATE TABLE IF NOT EXISTS webinar_feedback (
  id            uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  name          text NOT NULL,
  whatsapp      text NOT NULL,
  webinar       text,
  rating        integer CHECK (rating BETWEEN 1 AND 5),
  liked         text,
  suggestions   text,
  join_interest text,
  contact_pref  text,
  questions     text,
  submitted_at  timestamptz DEFAULT now()
);

-- Allow public insert & read (no login required)
ALTER TABLE webinar_registrations ENABLE ROW LEVEL SECURITY;
ALTER TABLE webinar_feedback      ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public insert registrations" ON webinar_registrations FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Public read registrations"   ON webinar_registrations FOR SELECT TO anon USING (true);
CREATE POLICY "Public insert feedback"      ON webinar_feedback      FOR INSERT TO anon WITH CHECK (true);
CREATE POLICY "Public read feedback"        ON webinar_feedback      FOR SELECT TO anon USING (true);

-- Verify
SELECT 'webinar_registrations' AS table_name, COUNT(*) FROM webinar_registrations
UNION ALL
SELECT 'webinar_feedback', COUNT(*) FROM webinar_feedback;
