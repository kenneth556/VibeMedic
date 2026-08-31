-- =============================================================================
-- Supabase RLS Template (ROW LEVEL SECURITY POLICIES)
-- Purpose: Enable RLS and define granular SELECT, INSERT, UPDATE, DELETE rules.
-- =============================================================================

-- Enable Row Level Security
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- -----------------------------------------------------------------------------
-- Profiles Policies
-- -----------------------------------------------------------------------------

-- SELECT: Public profile information is readable by any authenticated user
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE schemaname = 'public' 
        AND tablename = 'profiles' 
        AND policyname = 'Profiles are viewable by authenticated users'
    ) THEN
        CREATE POLICY "Profiles are viewable by authenticated users"
            ON public.profiles
            FOR SELECT
            TO authenticated
            USING (true);
    END IF;
END $$;

-- UPDATE: Users can only update their own profile
DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_policies 
        WHERE schemaname = 'public' 
        AND tablename = 'profiles' 
        AND policyname = 'Users can update their own profile'
    ) THEN
        CREATE POLICY "Users can update their own profile"
            ON public.profiles
            FOR UPDATE
            TO authenticated
            USING (auth.uid() = id)
            WITH CHECK (auth.uid() = id);
    END IF;
END $$;
