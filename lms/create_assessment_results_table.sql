-- Run in Supabase SQL Editor: Dashboard → SQL Editor → New query

create table if not exists assessment_results (
  id            text primary key,
  student_id    text not null,
  assessment_id text not null,
  score         numeric not null,
  remarks       text,
  recorded_at   timestamptz default now(),
  recorded_by   text,
  unique (student_id, assessment_id)
);

alter table assessment_results enable row level security;

create policy "Public read assessment_results"
  on assessment_results for select
  using (true);

create policy "Admin manage assessment_results"
  on assessment_results for all
  using (true)
  with check (true);
