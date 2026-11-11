# 0005 Don't automerge the weekly lockfile maintenance PR

Date: 2026-11-10

## Status

Accepted.

## Context

`.renovaterc.json`'s `lockFileMaintenance` block (the weekly `nix flake
update`-equivalent full `flake.lock` refresh, scheduled "before 6am on
monday") had `automerge: true, automergeType: "pr"`. Unlike the routine
per-input `digest` bumps (branch automerge, see
[decisions/0003](0003-gate-renovate-branch-automerge-with-ci.md)), this job
touches every flake input at once, including transitive lockfile entries that
don't get their own individual update — a bigger, harder-to-review diff than
any single-input bump. It was set to auto-merge itself once `Syntax & Lint`
passed, same as the routine updates, with no human ever looking at it.

Decided this one is worth reviewing by hand before it lands on `main`,
the same way a `major` update already requires (the shared
`github>William-Ro/renovate-config//default.json5` preset doesn't set
`automerge` for `major` at all, so those already sit open for manual merge).

## Decision

Set `lockFileMaintenance.automerge` to `false` (and drop the now-unused
`automergeType: "pr"`). The weekly job still opens a PR and still has to pass
`Syntax & Lint`, but it no longer merges itself — review and merge it by
hand, like a `major` update.

## Alternatives Considered

1. Leave it auto-merging. Rejected — a whole-lockfile refresh is exactly the
   kind of change worth a manual look before it lands, per the user's
   request.
2. Disable `lockFileMaintenance` entirely. Rejected — it's still useful for
   picking up transitive updates the per-input digest bumps wouldn't catch
   on their own; just don't auto-merge it.
3. Set `automerge: false`, keep everything else. Chosen — smallest change,
   matches how `major` updates already behave.

## Consequences

Positive:

- The one Renovate update most likely to need a human's judgment (a
  whole-lockfile refresh) now gets one, instead of silently merging weekly.

Tradeoffs:

- One more thing to remember to check/merge on Monday mornings, instead of
  it being fully hands-off.

## Follow-Up

- None.
