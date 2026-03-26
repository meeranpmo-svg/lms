-- ============================================================
-- FIX: Allow student self-registration to save to Supabase
-- Run this in Supabase → SQL Editor
-- ============================================================

-- 1. Allow anyone (anon) to INSERT a new student account
CREATE POLICY IF NOT EXISTS "Allow public student registration"
  ON public.users
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (role = 'student');

-- 2. Allow admin to read ALL users
CREATE POLICY IF NOT EXISTS "Admin can read all users"
  ON public.users
  FOR SELECT
  TO authenticated
  USING (true);

-- 3. Allow anon to read users (for login check)
CREATE POLICY IF NOT EXISTS "Allow public read for login"
  ON public.users
  FOR SELECT
  TO anon
  USING (true);

-- 4. Allow authenticated users to update their own record
CREATE POLICY IF NOT EXISTS "Users can update own record"
  ON public.users
  FOR UPDATE
  TO authenticated
  USING (id::text = current_setting('request.jwt.claims', true)::json->>'sub')
  WITH CHECK (true);

-- 5. Make sure RLS is enabled
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- 6. Also allow anon INSERT to enrollments (for auto-enrollment on register)
CREATE POLICY IF NOT EXISTS "Allow public enrollment on registration"
  ON public.enrollments
  FOR INSERT
  TO anon, authenticated
  WITH CHECK (true);
