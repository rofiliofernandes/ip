# Impression Photography — V10 fixes

Implemented from the V9 baseline:

- Admin management is Owner-only for invitations and deletion.
- Maximum of 5 active Admin accounts; pending invitations also consume slots.
- Owner invites an Admin by email only; no temporary password is created by the Owner.
- Invitation email uses Resend and contains a single-use, 24-hour verification link.
- Invited person verifies ownership by opening the link, then chooses their own name/password.
- Password fields support show/hide controls, including the Admin login page.
- Admin list shows role and account creation date and provides Owner-only deletion for Admins.
- Light-mode public sections use subtle alternating cream shades instead of dark-mode backgrounds.
- Dark admin controls keep high-contrast white text where their background is dark.
- Light-mode login/error states have stronger contrast.
- Instagram OAuth errors shown to users are generic; detailed errors are logged server-side.
- YouTube manual links are restricted to YouTube/YouTube-nocookie hosts.
- Password hashing target raised from 100,000 to 310,000 PBKDF2-SHA256 iterations. Existing hashes are upgraded after successful login when possible.
- R2 upload cleanup now also handles the crash window where an upload nonce was marked used but `uploaded_at` was never recorded.
