/**
 * Impression Photography — Careers Google Form Generator
 *
 * Deploy this script as a Web App:
 *   Execute as: Me
 *   Who has access: Anyone
 *
 * Add Script Property:
 *   GENERATOR_SECRET = <same secret configured in Cloudflare>
 */
function doGet(e) {
  try {
    var props = PropertiesService.getScriptProperties();
    var expected = String(props.getProperty('GENERATOR_SECRET') || '');
    var supplied = String((e.parameter && e.parameter.secret) || '');
    if (!expected || supplied !== expected) {
      return json_({ error: 'Unauthorized' });
    }

    var title = clean_(e.parameter.title, 180);
    if (!title) return json_({ error: 'Job title is required' });

    var description = clean_(e.parameter.description, 4000);
    var requirements = clean_(e.parameter.requirements, 4000);
    var duration = clean_(e.parameter.duration, 180);
    var validUntil = clean_(e.parameter.valid_until, 10);

    var form = FormApp.create('Impression Photography — ' + title);
    form.setDescription(buildDescription_(description, requirements, duration, validUntil));
    form.setCollectEmail(true);
    form.addTextItem().setTitle('Full name').setRequired(true);
    form.addTextItem().setTitle('Phone number').setRequired(true);
    form.addTextItem().setTitle('Portfolio / resume link').setRequired(false);
    form.addMultipleChoiceItem()
      .setTitle('Years of relevant experience')
      .setChoiceValues(['Less than 1 year', '1–2 years', '3–5 years', '5+ years'])
      .setRequired(true);
    form.addParagraphTextItem().setTitle('Tell us about yourself').setRequired(true);
    form.addParagraphTextItem().setTitle('Anything else you would like us to know?').setRequired(false);
    form.setConfirmationMessage('Thank you for applying to Impression Photography. We will review your application and contact you if your profile is shortlisted.');

    return json_({
      ok: true,
      editUrl: form.getEditUrl(),
      publishedUrl: form.getPublishedUrl()
    });
  } catch (err) {
    return json_({ error: String(err && err.message ? err.message : err) });
  }
}

function clean_(value, max) {
  return String(value || '').trim().slice(0, max);
}

function buildDescription_(description, requirements, duration, validUntil) {
  var parts = ['Application for Impression Photography.'];
  if (description) parts.push('\n\nRole description:\n' + description);
  if (requirements) parts.push('\n\nRequirements:\n' + requirements);
  if (duration) parts.push('\n\nDuration: ' + duration);
  if (validUntil) parts.push('\n\nApply by: ' + validUntil);
  return parts.join('');
}

function json_(value) {
  return ContentService
    .createTextOutput(JSON.stringify(value))
    .setMimeType(ContentService.MimeType.JSON);
}
