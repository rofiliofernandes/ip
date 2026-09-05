ALTER TABLE photos ADD COLUMN year INTEGER NOT NULL DEFAULT 2025;
ALTER TABLE photos ADD COLUMN category TEXT NOT NULL DEFAULT 'Other';
CREATE INDEX IF NOT EXISTS idx_photos_year_category ON photos(year, category);
