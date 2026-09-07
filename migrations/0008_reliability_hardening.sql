ALTER TABLE upload_nonces ADD COLUMN uploaded_at INTEGER;
CREATE INDEX IF NOT EXISTS idx_upload_nonces_uploaded ON upload_nonces(uploaded_at);
