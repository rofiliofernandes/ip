# Final Verification — Impression Photography

## Applied hardening

- First Owner setup remains email-verification based and requires `ADMIN_OWNER_EMAIL`; email ownership alone cannot claim a fresh installation.
- `ADMIN_SETUP_TOKEN` is not used by the application.
- `ADMIN_HOST` remains explicitly configured in the test `wrangler.toml`; production should use a dedicated management hostname.
- Admin state-changing API requests validate same-origin `Origin`/`Referer` headers when supplied.
- Successful login clears temporary login rate-limit counters.
- Admin service/video/photo inputs have server-side size/type/range validation.
- R2 upload authorization remains single-use and binds method, key, size, content type, expiry and nonce.
- Upload byte count is checked from the received body.
- Successful R2 uploads are recorded with `uploaded_at`; scheduled cleanup removes stale uploaded objects with no matching D1 photo record.
- Photo finalization cleans up the R2 object and quota reservation if D1 finalization fails.
- Instagram status is admin-only.
- Instagram token encryption can use a separate `TOKEN_ENCRYPTION_KEY`.
- Session cleanup and stale auth/upload records are scheduled.
- Script CSP does not include `unsafe-inline`.

## Verification performed in this environment

- `wrangler.toml` parsed successfully with Python TOML parser.
- Migration `0008_reliability_hardening.sql` was executed successfully against a SQLite test schema.
- No stale `ADMIN_SETUP_TOKEN` reference remains in application source/config examples.
- TypeScript parser reports no syntax diagnostics in the edited Worker; full type-check cannot complete here because npm dependencies are not installed.
- A fresh npm dependency installation was attempted but the environment could not complete registry resolution within the execution window, so no claim is made that `npm audit` or `npm run build` passed in this environment.
- No `package-lock.json` is included because it could not be generated without resolving the dependency tree.

## Required deployment configuration

Set these in Cloudflare Worker settings rather than committing real values:

- `ADMIN_OWNER_EMAIL` — Text; authorized first Owner email(s), comma-separated if needed.
- `RESEND_API_KEY` — Secret.
- `RESEND_FROM_EMAIL` — Text; address/domain verified in Resend.
- `SESSION_SECRET` — Secret, at least 32 random characters.
- `TOKEN_ENCRYPTION_KEY` — Secret, strongly random; separate from `SESSION_SECRET`.

Apply all D1 migrations before testing uploads.
