# 0003 Gate Renovate branch automerge with CI

Date: 2026-11-10

## Status

Accepted.

## Context

`.renovaterc.json` extends the shared `github>William-Ro/renovate-config//default.json5`,
which sets `automerge: true, automergeType: "branch"` for `minor`/`patch`/`pin`/`digest`/`pinDigest`
update types. Flake inputs tracked by git revision (`nixpkgs-unstable`,
`home-manager`, `firefox-addons`, `nix4nvchad`) have no real version, so
Renovate classifies their bumps as `digest` updates — the common case for
this repo. Renovate pushes these straight to a `renovate/*` branch and merges
it into `main` itself once that branch's required status checks pass; it
never opens a PR for them. (The separate weekly `lockFileMaintenance` job
uses `automergeType: "pr"` instead, so it isn't affected by this gap.)

`ci-pr.yml` has only ever had a `pull_request` trigger — it never had a
`push` trigger for `renovate/**` branches, in any commit. That went
unnoticed because `main`'s ruleset didn't require any status check before
[decision 0002](0002-enforce-pr-required-workflow.md). Once 0002 made
`Syntax & Lint` a required check for every merge to `main`, this became a
live bug: Renovate's branch-automerge path would never get that check to
post a status on its branches (no trigger fires for a plain `push` to
`renovate/**`), so those branches would sit stuck under "Pending Branch
Automerge" forever — the exact failure mode `William-Ro/homelab` hit and
documented in its own [decision 0002](https://github.com/William-Ro/homelab/blob/main/docs/decisions/0002-accept-renovate-automerge-without-ci-gate.md).
This repo's own decision 0002 flagged the risk in its Tradeoffs section but
concluded it "isn't currently at risk" — that conclusion was wrong: it
checked that the `pull_request` trigger has no path filter (0001), but never
checked whether a `push` trigger for `renovate/**` existed at all. Caught
before any Renovate update actually got stuck, by walking through how
Renovate's automerge would behave end to end.

## Decision

Add a `push` trigger on `renovate/**` branches to `ci-pr.yml`, running the
same `syntax` job as the `pull_request` trigger. Renovate's branch automerges
are now gated by `Syntax & Lint` like every other merge to `main`.

## Alternatives Considered

1. Leave `ci-pr.yml` as `pull_request`-only. Rejected — this is the bug being
   fixed; every branch-automerge update would get stuck indefinitely.
2. Switch `automergeType` to `"pr"` so every update goes through the same
   `pull_request`-triggered path. Bigger behavior change than needed, and
   loses the lighter-weight direct-branch-merge for routine digest bumps.
3. Add the `push` trigger, reusing the existing `syntax` job. Chosen —
   smallest change, matches `William-Ro/homelab`'s fix for the identical
   problem.

## Consequences

Positive:

- Renovate's branch-automerge path can actually complete — `Syntax & Lint`
  now posts a status on `renovate/**` branches, same as it does on PRs.
- No more CI-free path into `main`, for Renovate or anyone else.

Tradeoffs:

- Slightly more CI minutes (one more trigger path), negligible for a
  personal config repo.
- A bad update that still passes `nixfmt --check`/`nix flake check` (e.g. a
  flake input bump that evaluates fine but changes runtime behavior) still
  isn't caught by CI — `git revert` remains the recovery path.

## Follow-Up

- None.
