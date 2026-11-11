# 0001 Run CI on every PR, no path filter

Date: 2026-11-10

## Status

Accepted.

## Context

`ci-pr.yml`'s `pull_request` trigger had a `paths:` filter
(`**/*.nix`, `flake.lock`, `.github/workflows/**`). PR #77 (adding
`.github/instructions/`, `AGENTS.md`, `ARCHITECTURE.md`, `.gitignore`
changes — no `.nix` files) triggered **zero** checks, because none of its
files matched the filter. Noticed when the PR showed no status checks at
all.

This is the same gap `William-Ro/homelab` hit and fixed: a path-filtered
`pull_request` trigger silently skips any PR whose files don't match,
which is surprising for a repo where every change is expected to go
through a PR. Unlike homelab, nothing here currently *requires* `CI PR` to
pass before merge, so this wasn't blocking anyone — just silently
uninformative.

## Decision

Remove the `paths:` filter from `ci-pr.yml`'s `pull_request` trigger.
`CI PR` now runs on every PR targeting `main`, regardless of which files
changed.

## Alternatives Considered

1. Keep the path filter, accept that non-`.nix` PRs show no checks.
   Rejected — confusing, and inconsistent with "PR for every change" being
   the adopted workflow.
2. Narrow the filter instead of removing it (e.g. add `docs/**`,
   `*.md`, `.github/instructions/**`). Rejected — the filter would need
   updating every time a new file type is added to the repo; removing it
   entirely is simpler and the `syntax` job is fast/cheap enough that
   running it on every PR costs nothing meaningful.
3. Remove the filter entirely. Chosen.

## Consequences

Positive:

- Every PR gets a visible `CI PR` check, regardless of what it touches.
- One less thing to keep in sync as the repo's file types change.

Tradeoffs:

- Slightly more CI minutes (negligible for a personal repo, and the job
  only runs `nixfmt --check`/`nix flake check`/`deadnix`/`statix`, which
  are fast even when there's nothing Nix-related to check).

## Follow-Up

- None.
