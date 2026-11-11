# 0004 Make deadnix and statix required checks

Date: 2026-11-10

## Status

Accepted.

## Context

`ci-pr.yml`'s `Deadnix` and `Statix` steps both had `continue-on-error: true`
— the comment in the job description ("Syntax & Lint") implies the whole job
gates lint issues, but a non-zero exit from either step never actually failed
the job or the required `Syntax & Lint` check. `Lint`/CI existing specifically
to catch unused declarations and anti-patterns is undermined if it can never
actually block anything.

At the time this was set, the repo already had 16 `deadnix` warnings (unused
`pkgs`/`lib`/`config`/`inputs` function arguments across most `modules/`,
`hosts/`, and `homes/` files) and 7 `statix` warnings (empty `{ ... }:`
patterns that should be `_:`, two `boot.*` attribute sets with repeated keys
in both hosts' `hardware-configuration.nix`, and one `config.username`
assignment that should be `inherit`) — removing `continue-on-error` as-is
would have made every future PR fail immediately on pre-existing debt
unrelated to its own change.

## Decision

Fix every existing `deadnix`/`statix` warning first (purely mechanical:
drop unused lambda args, replace empty patterns with `_`, merge the repeated
`boot.*` keys into one `boot = { ... }` block per host, use `inherit (config)
username`), confirmed clean locally (`nixfmt --check`, `nix flake check`,
`deadnix`, `statix` all exit 0), then remove `continue-on-error: true` from
both steps.

## Alternatives Considered

1. Remove `continue-on-error` without fixing existing warnings. Rejected —
   would make `Syntax & Lint` fail on `main` itself and block the very next
   PR for unrelated reasons.
2. Leave `continue-on-error: true` in place indefinitely. Rejected — this is
   what prompted the fix: lint existing only to be silently ignored forever
   isn't meaningfully different from not running it.
3. Fix the warnings and make both checks blocking. Chosen.

## Consequences

Positive:

- `Syntax & Lint` now actually enforces `deadnix`/`statix`, not just format
  and flake-eval.
- Repo-wide nix style debt (16 unused-arg + 7 anti-pattern warnings) is
  cleared in one pass instead of accumulating further.

Tradeoffs:

- Future PRs that introduce a new unused argument or anti-pattern will now
  fail CI outright instead of only showing a warning — intentional, since
  that's the point of making it required.
- `hosts/*/hardware-configuration.nix` are nixos-generate-config-managed
  files (comment: "Do not modify this file!"); the `boot.*` merge and unused
  `pkgs` removal there are purely cosmetic/no behavior change, but a future
  `nixos-generate-config` re-run will likely re-flatten the `boot.*` keys and
  may reintroduce the unused `pkgs` argument — that's expected and fine to
  fix again the same way if `statix`/`deadnix` flag it a second time.

## Follow-Up

- None.
