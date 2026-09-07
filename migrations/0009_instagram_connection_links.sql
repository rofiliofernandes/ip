CREATE TABLE IF NOT EXISTS instagram_connection_links (
  token_hash TEXT PRIMARY KEY,
  expires_at INTEGER NOT NULL,
  used_at INTEGER,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IF NOT EXISTS idx_instagram_connection_links_expires ON instagram_connection_links(expires_at);
