-- V3 safety: these objects are also ensured at runtime for deployments where
-- the D1 migration command was not run before the Worker was deployed.
CREATE TABLE IF NOT EXISTS site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT OR IGNORE INTO site_settings(key,value) VALUES
 ('hero_config','{"count":4,"source":"latest_instagram","photo_ids":[],"interval":7,"transition":"normal"}'),
 ('gallery_config','{"mode":"distribution","distribution":{},"photo_ids":[],"published":true}'),
 ('strip_config','{"photo_ids":[],"interval":6,"speed":"normal"}');

CREATE TABLE IF NOT EXISTS careers (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  requirements TEXT NOT NULL DEFAULT '',
  description TEXT NOT NULL DEFAULT '',
  salary_disclosed INTEGER NOT NULL DEFAULT 0,
  salary_text TEXT NOT NULL DEFAULT '',
  duration TEXT NOT NULL DEFAULT '',
  valid_until TEXT,
  google_form_url TEXT NOT NULL DEFAULT '',
  active INTEGER NOT NULL DEFAULT 1,
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
