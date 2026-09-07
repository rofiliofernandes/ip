CREATE TABLE IF NOT EXISTS site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT OR IGNORE INTO site_settings(key,value) VALUES
 ('hero_config','{"count":4,"source":"latest_instagram","photo_ids":[],"interval":7,"transition":"normal"}'),
 ('gallery_config','{"mode":"distribution","distribution":{},"photo_ids":[],"published":true}'),
 ('strip_config','{"photo_ids":[],"interval":6,"speed":"normal"}');
