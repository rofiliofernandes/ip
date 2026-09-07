# Production setup fix

## Changes

1. Owner password creation now uses 100,000 PBKDF2-SHA256 iterations for new passwords. Existing password hashes retain their stored iteration count and continue to verify normally.
2. Owner creation now checks D1 batch result success explicitly and logs the server-side exception as `OWNER_CREATE_ERROR` without exposing internal details to the browser.
3. Added `keep_vars = true` to `wrangler.toml` so dashboard-managed variables are preserved during Wrangler deployments.

## Why

The deployed Worker was returning a generic 500 during `/api/setup/create`. The previous implementation used 310,000 PBKDF2 iterations on a Worker Free environment with a 10 ms CPU limit. The lower work factor is a compatibility tradeoff for the current deployment environment. Owner setup still requires an authorized email + OTP and a minimum 12-character password, and login/setup rate limits remain unchanged.
