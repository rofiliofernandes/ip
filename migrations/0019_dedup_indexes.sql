CREATE INDEX IF NOT EXISTS idx_photos_source_sourceid ON photos(source, source_id);
CREATE INDEX IF NOT EXISTS idx_videos_source_url ON videos(source_url);
CREATE INDEX IF NOT EXISTS idx_photos_published_created ON photos(published, created_at);
