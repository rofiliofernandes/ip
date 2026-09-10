CREATE TABLE IF NOT EXISTS instagram_reel_ignores (
  id TEXT PRIMARY KEY,
  video_id TEXT NOT NULL,
  source_url TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL DEFAULT '',
  category TEXT NOT NULL DEFAULT 'Other',
  deleted_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_instagram_reel_ignores_video ON instagram_reel_ignores(video_id);
