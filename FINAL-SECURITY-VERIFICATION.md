# Final security verification

Implemented from the security inspection:

- First Owner setup is restricted to `ADMIN_OWNER_EMAIL` and still requires a Resend email code.
- Verification codes are hashed, expire after 10 minutes, and are attempt-limited.
- Setup request limits are applied per IP, per authorized email, and globally.
- Login attempts are throttled per IP and per account identifier; successful legacy password hashes are upgraded to 310,000 PBKDF2-SHA256 iterations.
- Instagram status is admin-only.
- Instagram token encryption has a separate `TOKEN_ENCRYPTION_KEY` with legacy fallback for existing tokens.
- Upload authorization binds method, key, expected byte size, content type, expiry, and a single-use nonce.
- Upload size is checked against actual received bytes, not only `Content-Length`.
- Uploads use a D1-backed storage reservation to reduce quota races; reservations expire automatically.
- Instagram R2 imports use the same quota reservation accounting.
- Expired sessions, setup records, rate-limit records, upload nonces, and stale storage reservations are cleaned by the scheduled task.
- Script CSP no longer allows `unsafe-inline`.
- `ADMIN_HOST` is explicitly configured for the test Worker hostname; production should use a separate management hostname and Cloudflare Access.

Known deployment requirements:

- Add `ADMIN_OWNER_EMAIL` as a Cloudflare Text variable.
- Add `TOKEN_ENCRYPTION_KEY` as a Cloudflare Secret.
- Keep `SESSION_SECRET` as a strong random Secret.
- Keep `RESEND_API_KEY` and `RESEND_FROM_EMAIL` configured for setup emails.
- Apply migration `0007_security_hardening.sql` before using upload/rate-limit features.


Additional hardening: upload_nonces now tracks uploaded_at for orphan cleanup; photo finalization cleans R2 on D1 failure; admin write inputs have server-side bounds; state-changing admin requests validate same-origin headers when present; successful logins clear temporary throttles.
