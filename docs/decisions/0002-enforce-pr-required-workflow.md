# 0002 Enforce PR-required workflow with a required status check

Date: 2026-11-10

## Status

Accepted.

## Context

`main`'s branch ruleset only blocked deletion — no required PR, no required
status check, no required review. "Open a PR for every change" was documented
as the adopted convention (`AGENTS.md`, `pr-workflow.instructions.md`), but
nothing in GitHub actually enforced it; a direct `git push` to `main` was
still possible, and a merged PR could land without `CI PR`'s `Syntax & Lint`
job having run or passed.

`William-Ro/homelab` already solved this identically: a ruleset requiring a
PR (0 approvals, solo-maintained) plus required status checks, with a bypass
actor for Renovate's branch-automerge Integration so dependency updates can
still land without opening a PR while still being gated by the same required
check.

## Decision

Updated the existing ruleset (`Main Branch Ruleset`, id `13970002`) to add:

- `non_fast_forward` — no force-pushes to `main`.
- `pull_request` — requires a PR to merge, `required_approving_review_count: 0`
  (solo-maintained, no second reviewer exists).
- `required_status_checks` — requires the `Syntax & Lint` check (the only job
  in `ci-pr.yml`) to pass.

Kept the existing `deletion` rule and the existing Renovate Integration
bypass actor (`bypass_mode: always`) unchanged, so Renovate's branch
automerge can still bypass the PR-required rule — but the required status
check still applies to it regardless, the same way homelab's does (see
`William-Ro/homelab`'s decision on Renovate automerge).

## Alternatives Considered

1. Leave the ruleset as deletion-only, rely on convention alone. Rejected —
   this is exactly the gap that made "PR for every change" unenforceable in
   practice.
2. Require a reviewer approval. Rejected — solo-maintained repo, no second
   reviewer exists to approve.
3. Add `pull_request` + `required_status_checks`, keep the existing bypass
   actor for Renovate. Chosen — mirrors homelab's proven setup exactly.

## Consequences

Positive:

- `main` can no longer be pushed to directly; every change goes through a PR
  that has to pass `Syntax & Lint` first.
- Matches `William-Ro/homelab`'s enforcement model, so the two repos' CI
  stories are consistent.

Tradeoffs:

- Renovate's branch-automerge still needs `Syntax & Lint` to post a status
  before it can merge — if `ci-pr.yml` is ever accidentally restricted to not
  trigger on `renovate/**` push/PR events, automerges would get stuck the way
  homelab's did (see `William-Ro/homelab`'s decision 0002 for that exact
  failure mode). `ci-pr.yml`'s `pull_request` trigger has no path filter
  (decision 0001), so this isn't currently at risk, but worth remembering if
  the trigger is ever narrowed again.

## Follow-Up

- None.
