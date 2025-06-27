SELECT id, members, pg_typeof(members) FROM public.workspaces;
UPDATE public.workspaces SET members = members::uuid[] WHERE pg_typeof(members) != 'uuid[]'; 