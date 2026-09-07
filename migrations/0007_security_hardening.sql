CREATE TABLE IF NOT EXISTS auth_rate_limits (
  key TEXT PRIMARY KEY,
  window_start INTEGER NOT NULL,
  count INTEGER NOT NULL DEFAULT 0,
  blocked_until INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS storage_quota (
  id INTEGER PRIMARY KEY CHECK(id=1),
  reserved_bytes INTEGER NOT NULL DEFAULT 0
);
INSERT OR IGNORE INTO storage_quota(id,reserved_bytes) VALUES(1,0);

CREATE TABLE IF NOT EXISTS storage_reservations (
  id TEXT PRIMARY KEY,
  bytes INTEGER NOT NULL,
  key TEXT,
  expires_at INTEGER NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_storage_reservations_expires ON storage_reservations(expires_at);

CREATE TABLE IF NOT EXISTS upload_nonces (
  id TEXT PRIMARY KEY,
  reservation_id TEXT NOT NULL,
  key TEXT NOT NULL,
  expected_size INTEGER NOT NULL,
  content_type TEXT NOT NULL,
  expires_at INTEGER NOT NULL,
  used_at INTEGER
);
CREATE INDEX IF NOT EXISTS idx_upload_nonces_expires ON upload_nonces(expires_at);
