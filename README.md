# gh-landscaper

A GitHub CLI extension to clean up stale and merged branches.

## Features

- **Merged Branch Detection**: Identifies branches associated with PRs merged in the last X days.
- **Stale Branch Detection**: Identifies branches with no commits in the last X days.
- **Safety**: 
  - Performs a **Dry Run** by default.
  - Ignores protected branches (`main`, `master`, `dev`, `staging`).
  - Uses `git branch -d` (safe delete) to ensure Git's internal safety checks also apply.

## Prerequisites

- [GitHub CLI](https://cli.github.com/) (`gh`) installed and authenticated.
- [Git](https://git-scm.com/) installed.
- Python 3.

## Installation

```bash
gh extension install mpran/gh-landscaper
```
*(Replace `mpran` with your actual GitHub username if different)*

## Usage Reference

### Basic Commands

| Command | Description |
| :--- | :--- |
| `gh landscaper` | **Dry Run**: Lists all branches that *would* be deleted, but performs no actions. |
| `gh landscaper --confirm` | **Execute**: Actually deletes the identified stale and merged branches. |

### Configuration Flags

You can customize the filtering logic with the following flags:

#### `--merged-days <number>`
**Default:** `60`
Specifies the number of days since a Pull Request was merged to consider its branch eligible for deletion.
*Example:* `gh landscaper --merged-days 7` (Clean up branches merged > 7 days ago)

#### `--stale-days <number>`
**Default:** `30`
Specifies the number of days since the last commit to consider a branch "stale".
*Example:* `gh landscaper --stale-days 90` (Clean up branches with no activity for 3 months)

#### `--author <username/name>`
**Default:** `None` (Checks all authors)
Filters branches by a specific author.
- For **Merged PRs**: Checks the GitHub username of the PR author.
- For **Stale Branches**: Checks the Git author name (substring match).
*Example:* `gh landscaper --author mpran` (Only clean up branches created/merged by `mpran`)

### Examples

**Clean up strictly my own branches that are very old:**
```bash
gh landscaper --author mpran --stale-days 120 --confirm
```

**Aggressive cleanup of recently merged branches:**
```bash
gh landscaper --merged-days 2
```

## How it works

1. Fetches closed PRs from the current repository using `gh api`.
2. Checks local git refs for last commit time using `git for-each-ref`.
3. compares against protected branches.
4. Outputs a colored list of branches to be removed.
