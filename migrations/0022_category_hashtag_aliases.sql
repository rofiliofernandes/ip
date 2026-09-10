CREATE TABLE IF NOT EXISTS category_hashtag_aliases (
  hashtag TEXT PRIMARY KEY,
  category TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
