-- Run this in Supabase SQL Editor:
-- Dashboard → SQL Editor → New query → paste & run

create table if not exists recordings (
  id           text primary key,
  course_id    text,
  title        text not null,
  drive_url    text not null,
  session_date date,
  description  text,
  created_at   timestamptz default now()
);

-- Allow public read (students need to read without auth)
alter table recordings enable row level security;

create policy "Public read recordings"
  on recordings for select
  using (true);

create policy "Admin insert/update recordings"
  on recordings for all
  using (true)
  with check (true);
