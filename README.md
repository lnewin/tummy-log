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

## Accounts and syncing

When `config.js` has a Supabase project's URL and anon key, the app asks people to **create an account or log in** (email and password). Each person's diary is saved to their account, so they can log in on any phone, tablet or computer and see the same data. A copy is kept on the device so it works without signal; changes made offline sync when the connection comes back. Logging out removes the copy from that device. Anything logged on a device before logging in is moved into the account the first time someone logs in there. Password reset by email is included.

Each person can only read and change their own entries. This is enforced by the database's row level security rules in `supabase/schema.sql`, not just by the app.

### One-time Supabase setup

1. Create a free project at [supabase.com](https://supabase.com).
2. **SQL Editor → New query**: paste the contents of `supabase/schema.sql` and click **Run**.
3. **Authentication → URL Configuration**: set **Site URL** to the app's web address (for example `https://tummy-log.vercel.app`) and add the same address under **Redirect URLs**. This is where confirmation and password-reset emails send people.
4. **Project Settings → API** (or **Data API**): copy the **Project URL** and the **anon public** key into `config.js`, then commit and push. The anon key is designed to be public; never put the `service_role` key in the app.

If `config.js` is left empty, the app runs without accounts and keeps data in the browser on each device (see below).

## Without accounts

The log is saved in the browser on that device (localStorage). It stays when the page is closed, but can be lost if browser data is cleared, in a private window, on iPhone if the site isn't opened for 7 days (unless it's on the Home Screen), or if the phone is replaced. Add it to the Home Screen, and use **Diary → Keep your log safe → Download a backup** now and then. **Restore from a backup** loads it back on any device.

Opened as a Claude artifact, entries are saved to the viewer's Claude account instead. Barcode scanning doesn't work inside Claude.

## Hosting

**Vercel:** at vercel.com/new, import this repository, leave Framework Preset as "Other" with no build settings, and deploy. Every push to `main` updates the site.

**GitHub Pages** (public repositories on free accounts): Settings → Pages, deploy from branch `main`, folder `/ (root)`.

## How the patterns work

For every time a food was eaten, the app checks whether a symptom was logged inside the time window. That gives the food's symptom rate, which is compared with the usual rate across all meals. Small samples are pulled toward the usual rate, so a food eaten only once or twice can't top the list. A food needs at least 5 meals, 3 of them followed by symptoms, a rate of 50% or more, and 1.3 times the usual rate to be marked "Strong".

These patterns are clues, not a diagnosis. Ongoing or severe symptoms should be checked by a doctor.
