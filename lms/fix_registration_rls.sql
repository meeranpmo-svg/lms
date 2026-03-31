-- ============================================================
-- FIX: Allow student self-registration to save to Supabase
-- Run this in Supabase → SQL Editor
-- ============================================================

-- Drop existing policies first (ignore errors if they don't exist)
DROP POLICY IF EXISTS "Allow public student registration" ON public.users;
DROP POLICY IF EXISTS "Admin can read all users" ON public.users;
DROP POLICY IF EXISTS "Allow public read for login" ON public.users;
DROP POLICY IF EXISTS "Users can update own record" ON public.users;
DROP POLICY IF EXISTS "Allow public enrollment on registration" ON public.enrollments;

-- Enable RLS
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.enrollments ENABLE ROW LEVEL SECURITY;

-- 1. Allow anyone to INSERT a new student account via registration
CREATE POLICY "Allow public student registration"
  ON public.users
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (role = 'student');

-- 2. Allow anyone to read users (needed for login)
CREATE POLICY "Allow public read for login"
  ON public.users
  FOR SELECT
  TO anon, authenticated
  USING (true);

-- 3. Allow authenticated users to update any user (admin use)
CREATE POLICY "Allow authenticated update"
  ON public.users
  FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- 4. Allow anyone to insert enrollments (auto-enroll on register)
CREATE POLICY "Allow public enrollment on registration"
  ON public.enrollments
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);

-- 5. Allow anyone to read enrollments
CREATE POLICY "Allow public read enrollments"
  ON public.enrollments
  FOR SELECT
  TO anon, authenticated
  USING (true);
