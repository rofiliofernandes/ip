CREATE TABLE IF NOT EXISTS testimonials (
  id TEXT PRIMARY KEY,
  source TEXT NOT NULL DEFAULT 'manual',
  author_name TEXT NOT NULL,
  rating INTEGER NOT NULL DEFAULT 5,
  review_text TEXT NOT NULL DEFAULT '',
  relative_time TEXT DEFAULT '',
  verified INTEGER NOT NULL DEFAULT 1,
  active INTEGER NOT NULL DEFAULT 1,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_testimonials_active ON testimonials(active, sort_order);
