---
description: "Agents implement changes end-to-end (branch, commit, push, open PR) using Conventional Commits; the user reviews and merges in GitHub."
---

# PR Workflow Instructions

## Your Mission

Open a PR for every change — that's the adopted convention in this repo
(mirroring `William-Ro/homelab`), even though `main`'s branch ruleset doesn't
yet enforce it (only a deletion-protection rule exists — see
[ARCHITECTURE.md](../../ARCHITECTURE.md#governance--enforcement-mechanisms)).
The repo's history predates this convention and mixes direct pushes with PR
merges — don't treat that as license to push directly going forward.

Carry a change all the way to an open pull request without stopping to ask
for each git step. The user's job is reviewing and merging PRs in GitHub, not
running git commands for you.

## Workflow

1. If currently on `main`, create a feature branch first: `git checkout -b <type>/<short-slug>`.
2. Make the change.
3. Commit it yourself using the Conventional Commits format below — don't
   just print the message and wait.
4. Push the branch: `git push -u origin <branch>`.
5. Open the PR with an explicit `--title`/`--body` containing real Markdown
   (backticks around file paths/commands, `##` section headers, linked
   `docs/decisions/` entries). **Don't use `gh pr create --fill`** — it
   copies the raw commit message verbatim into the PR body, which renders as
   unformatted prose even if the commit message itself used Markdown syntax
   inconsistently. Report the PR URL back to the user.
6. Stop there. **Never merge the PR yourself** — the user reviews and merges
   it in GitHub. Don't approve, don't use `gh pr merge`.

One logical change = one commit = one PR. Don't bundle unrelated changes into
the same branch.

## Still ask first

The workflow above doesn't need per-step confirmation, but the existing
safety rules still apply — ask before:

- Anything in AGENTS.md's ["Stop and ask before"](../../AGENTS.md#stop-and-ask-before)
  list (`stateVersion` bumps, `hardware-configuration.nix` changes, the
  NVIDIA driver pin, shared Renovate/CI infrastructure).
- Force-pushing, rewriting published history, or deleting a branch.
- Merging the PR, which is always the user's call.

## Commit Message Format (Conventional Commits)

```
<type>(<scope>): <short description>
```

- **type** — what kind of change (required, see table below)
- **scope** — area affected, optional but preferred (e.g. `desktop`, `gnome`, `nix`)
- **description** — lowercase, imperative mood, no period, under 72 characters

| Type       | When to use                                                 |
| ---------- | ----------------------------------------------------------- |
| `feat`     | A new host, module, or capability was added                 |
| `fix`      | A bug or misconfiguration was corrected                     |
| `chore`    | Maintenance, tooling, restructuring without behavior change |
| `docs`     | Documentation only changes (README, comments, instructions) |
| `refactor` | Config restructured without adding features or fixing bugs  |
| `style`    | Formatting, whitespace, naming — no logic change            |
| `ci`       | CI/CD pipeline changes                                      |
| `revert`   | Reverting a previous commit                                 |

Examples:

```
feat(desktop): add gst-plugins-good for hanabi GTK4 media backend
fix(nix): drop boot.initrd.systemd.enable, scripted initrd removed upstream
chore: update gitignore
docs: add architecture doc, agent instructions, and docs/ governance tree
ci: drop ci-main and auto-format, match homelab's two-workflow shape
```

## PR Content

- PR title mirrors the primary commit message.
- PR body: a short summary of what changed and why, linking any relevant
  `docs/decisions/`, `docs/runbooks/`, or `docs/playbooks/` entry.
