CREATE TABLE IF NOT EXISTS youtube_sync_ignores (
  id TEXT PRIMARY KEY,
  video_id TEXT NOT NULL,
  source_url TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL DEFAULT '',
  category TEXT NOT NULL DEFAULT 'Other',
  deleted_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_youtube_sync_ignores_video ON youtube_sync_ignores(video_id);
