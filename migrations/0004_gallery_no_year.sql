-- Gallery is category-first. Year is no longer part of the content model.
DROP INDEX IF EXISTS idx_photos_year_category;
DROP INDEX IF EXISTS idx_videos_year_category;
ALTER TABLE photos DROP COLUMN year;
ALTER TABLE videos DROP COLUMN year;
