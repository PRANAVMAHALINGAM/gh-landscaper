# How to Publish `gh-landscaper`

GitHub CLI extensions are simply public repositories that contain an executable named `gh-<extensionname>`. There isn't a formal "Marketplace" submission process like GitHub Actions, but following these steps makes your extension installable and discoverable.

## 1. Prepare the Repository

Ensure your repository is named `gh-landscaper`. This is the standard naming convention.

```bash
# If you haven't created the repo on GitHub yet
gh repo create gh-landscaper --public --source=. --push
```

## 2. Add the `gh-extension` Topic

To help users find your extension, add the `gh-extension` topic to your repository.

1. Go to your repository on GitHub.
2. Click the **Gear icon** next to "About" on the main page.
3. In the "Topics" field, type `gh-extension` and save.

## 3. Create a Release (Optional but Recommended)

Creating a release helps users know they are getting a stable version, though `gh extension install` usually pulls the latest default branch.

```bash
gh release create v1.0.0 --title "v1.0.0" --notes "Initial release of gh-landscaper"
```

## 4. How Users Install It

Once public, anyone can install it using your username and repository name:

```bash
gh extension install <your-username>/gh-landscaper
```

## 5. updating the Extension

To push updates:
1. Commit your changes locally.
2. Push to the default branch (`main`).
3. Users will receive updates when they run:
   ```bash
   gh extension upgrade gh-landscaper
   ```
