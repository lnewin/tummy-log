# Tummy Log

A food and stomach-symptom diary that spots which foods tend to come before symptoms.

## Use it

Open the app in any browser, on a phone or a computer. On a phone, add it to your Home Screen (see "Keeping your data safe" below).

- **Log**: pick the day at the top (it starts on today), then fill in the sections underneath for that day.
  - **Meals**: list each food or ingredient, pick a saved recipe, or scan a barcode on packaged food. Each food is tagged with its allergens, food group and FODMAP level as you type.
  - **Daily symptom check**: a tick list for bloating, stomach pain, cramps, nausea, wind, heartburn, croakiness (with an "I burped" option), eye twitch and other. Ticking a symptom opens a 1 to 5 severity rating, when it started and how long it lasted, or "All day". Saving with nothing ticked records a symptom-free day.
  - **Poop**: consistency on the Bristol stool scale (1 to 7) and the time.
  - **Day context**: stress level, period, hours of sleep, exercise and any other illness.
- **Diary**: everything logged, grouped by day, with edit and delete, plus backup and restore.
- **Calendar**: a month view. Choose what it shows: poop tally, period days, meal count, all symptoms, no symptoms, or any mix of single symptoms. Tap a day to see everything logged that day.
- **Recipes**: save recipes you make often. Each ingredient has a quantity (whole numbers, decimals or fractions like 1/2) and a unit such as g, ml, tsp, cloves or tins. Log one as a meal in one tap. If you change it that day, the change is saved as a dated variation under the main recipe, ready to reuse.
- **Patterns**: how often symptoms followed each food within a chosen time window (2 to 12 hours by default), compared with the usual rate across all meals. Switch between individual foods, allergens, food groups and FODMAP groups. Hard poops (types 1 to 2) and loose poops (types 6 to 7) count as symptoms. A second table compares symptom days with and without each context factor. Tap "See an example" to try it with made-up data.

## Food recognition

A built-in list of around 300 common foods and ingredients gives each one its food group, UK allergens (the 14 that must be labelled) and a general FODMAP rating (high, with the FODMAP type, or low). Anything not on the list shows as "not recognised" and is still used in the food patterns. FODMAP ratings are general guidance and depend on portion size; a dietitian can give personal advice.

## Barcode scanning

Tap **Scan a barcode** on the meal form. It uses the phone's camera, or you can take a photo of the barcode or type the number. The product's name and ingredients come from [Open Food Facts](https://world.openfoodfacts.org), a free public food database, and you pick which ones to add. Scanning needs the site to be served over HTTPS (Vercel and GitHub Pages both do this) and an internet connection. Some products aren't in the database; those have to be typed in by hand.

## Keeping your data safe

On the website, the log is saved in the browser on that device (localStorage). It stays when the page is closed or the phone restarts. The app also asks the browser to treat its storage as persistent. It can still be lost if:

- browser data or site data is cleared
- it's used in a private or incognito window
- on iPhone, Safari clears data for websites not visited for 7 days, unless the site was added to the Home Screen and is opened from there
- the phone is lost or replaced

So:

1. **Add it to the Home Screen.** iPhone: Share → Add to Home Screen. Android (Chrome): menu → Add to Home screen / Install app. It then opens like an app, with its own icon.
2. **Download a backup now and then.** Diary → Keep your log safe → Download a backup saves a `.json` file. Save it to email or a cloud drive. A reminder appears on the Log page if there's no backup in the last week. **Restore from a backup** loads it back on any device.

Opened as a Claude artifact, entries are saved to the viewer's Claude account instead, and sync across their devices. Barcode scanning doesn't work inside Claude.

For automatic syncing between devices on the website, the app would need accounts and a database (for example Supabase); it doesn't have that yet.

## Hosting

**Vercel:** at vercel.com/new, import this repository, leave Framework Preset as "Other" with no build settings, and deploy. Every push to `main` updates the site.

**GitHub Pages** (public repositories on free accounts): Settings → Pages, deploy from branch `main`, folder `/ (root)`.

## How the patterns work

For every time a food was eaten, the app checks whether a symptom was logged inside the time window. That gives the food's symptom rate, which is compared with the usual rate across all meals. Small samples are pulled toward the usual rate, so a food eaten only once or twice can't top the list. A food needs at least 5 meals, 3 of them followed by symptoms, a rate of 50% or more, and 1.3 times the usual rate to be marked "Strong".

These patterns are clues, not a diagnosis. Ongoing or severe symptoms should be checked by a doctor.
