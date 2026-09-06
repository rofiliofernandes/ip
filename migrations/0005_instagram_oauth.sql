CREATE TABLE IF NOT EXISTS instagram_integrations (
  provider TEXT PRIMARY KEY,
  user_id TEXT NOT NULL,
  username TEXT DEFAULT '',
  access_token_enc TEXT NOT NULL,
  expires_at INTEGER,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
