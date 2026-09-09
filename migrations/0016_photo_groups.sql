ALTER TABLE photos ADD COLUMN group_id TEXT;
ALTER TABLE photos ADD COLUMN group_order INTEGER NOT NULL DEFAULT 0;
CREATE INDEX IF NOT EXISTS idx_photos_group_id ON photos(group_id);
