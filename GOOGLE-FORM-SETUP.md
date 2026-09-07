# Google Form Generator — one-time setup

The Careers admin now has **Generate Google Form**. It creates an application form using Google Apps Script, opens the form editor in a new tab, and returns the form URL so it can be saved on the career opening.

Google's Forms service requires Google authorization. For this single-client photography site, the simplest setup is a small Google Apps Script that runs as the client's Google account.

## 1. Create the Apps Script

Open Google Apps Script and create a new project. Paste the contents of `google-form-generator.gs` into the editor.

## 2. Set the secret

In Apps Script, open **Project Settings → Script properties** and add:

- Property: `GENERATOR_SECRET`
- Value: a long random string, for example 32+ random characters

Use the same secret in the Cloudflare Worker variable `GOOGLE_FORMS_SCRIPT_SECRET`.

## 3. Deploy as a web app

Deploy → New deployment → Web app.

Recommended settings:

- Execute as: **Me** (the Google account that should own the generated forms)
- Who has access: **Anyone**

Copy the generated Web app URL. Put that URL in the Worker variable `GOOGLE_FORMS_SCRIPT_URL`.

## 4. Deploy the Worker

Add these non-secret configuration variables to the Worker:

```text
GOOGLE_FORMS_SCRIPT_URL=https://script.google.com/macros/s/YOUR_DEPLOYMENT_ID/exec
GOOGLE_FORMS_SCRIPT_SECRET=your-long-random-secret
```

Then deploy normally.

## 5. How it works

In **Admin → Careers**:

1. Enter the job title and other job details.
2. Click **Generate Google Form**.
3. A new browser tab opens immediately.
4. The Worker asks the Apps Script to create the form.
5. The form is created in the connected Google account with common application questions.
6. The new form editor opens in that tab.
7. The generated response URL is placed into the Google Form link field.

If the one-time generator is not configured yet, the button safely falls back to opening Google's form-creation page and shows a setup message instead of pretending a form was generated.
