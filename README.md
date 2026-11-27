# Tummy Log

A food and stomach-symptom diary that spots which foods tend to come before symptoms.

## Use it

Open the app in any browser, on a phone or a computer. On a phone, use your browser's "Add to Home Screen" option to keep it one tap away.

- **Log**: add meals (list each food or ingredient) and symptoms (type, severity 1 to 5, when it started).
- **Diary**: everything logged, grouped by day, with edit and delete.
- **Patterns**: for each food, how often a symptom followed within a chosen time window (2 to 12 hours by default), compared with the usual rate across all meals. Tap "See an example" to try it with made-up data.

## Where the data is kept

The whole app is one file, `index.html`, with no server and no sign-up.

- Opened from a normal web address (for example GitHub Pages), entries are saved in that browser on that device only. Clearing browser data deletes them, and they don't sync between a phone and a computer.
- Opened as a Claude artifact, entries are saved to the viewer's Claude account and sync across their devices. Each person only sees their own entries.

## Hosting it with GitHub Pages

1. In this repository, go to **Settings → Pages**.
2. Under **Build and deployment**, set **Source** to "Deploy from a branch", pick `main` and `/ (root)`, then **Save**.
3. After a minute the app is live at `https://<owner>.github.io/<repository-name>/`.

## How the patterns work

For every time a food was eaten, the app checks whether a symptom was logged inside the time window. That gives the food's symptom rate, which is compared with the usual rate across all meals. Small samples are pulled toward the usual rate, so a food eaten only once or twice can't top the list. A food needs at least 5 meals, 3 of them followed by symptoms, a rate of 50% or more, and 1.3 times the usual rate to be marked "Strong".

These patterns are clues, not a diagnosis. Ongoing or severe symptoms should be checked by a doctor.
