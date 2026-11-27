-- Tummy Log database setup. Run once in Supabase: SQL Editor → New query → paste → Run.

create table if not exists public.entries (
  user_id    uuid        not null default auth.uid() references auth.users (id) on delete cascade,
  id         text        not null,
  kind       text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

-- Each person can only see and change their own entries.
alter table public.entries enable row level security;

drop policy if exists "Read own entries" on public.entries;
drop policy if exists "Add own entries" on public.entries;
drop policy if exists "Change own entries" on public.entries;
drop policy if exists "Delete own entries" on public.entries;

create policy "Read own entries"   on public.entries for select using (auth.uid() = user_id);
create policy "Add own entries"    on public.entries for insert with check (auth.uid() = user_id);
create policy "Change own entries" on public.entries for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Delete own entries" on public.entries for delete using (auth.uid() = user_id);
