# Repository guidance

## Project architecture

This repository is a single Nix flake declaring both NixOS system
configurations and home-manager user configurations for two physical
machines, `desktop` and `laptop`. See [`ARCHITECTURE.md`](../ARCHITECTURE.md)
for the full deep-dive; the summary:

- [`flake.nix`](../flake.nix) declares flake inputs and a `{ hosts, homes }`
  map, passed to [`bootstrap/default.nix`](../bootstrap/default.nix), which
  generates `nixosConfigurations`, `homeConfigurations`, and `devShells` for
  each system.
- `hosts/<name>/` is one machine's NixOS configuration; `homes/<name>/` is
  that same machine's home-manager profile (keyed by **machine**, not by
  username — there is one home profile per host).
- `modules/autoload/` applies to every host and home automatically, with no
  explicit import. Everything else under `modules/` (`common/`, `system/`,
  `gaming/`, `gnome/`) is opted into per host/home via
  `lib.imports [ "category/name" ... ]`, a helper defined in
  [`bootstrap/lib.nix`](../bootstrap/lib.nix) that resolves bare strings to
  `modules/<string>.nix` or `modules/<string>/default.nix`.

## Validation

There is no application build or test suite — the closest equivalents are:

```sh
nix shell nixpkgs#nixfmt --command \
  find . -name "*.nix" -not -path "./.git/*" -not -name "result" -exec nixfmt --check {} +

nix flake check --no-build
```

Both run in CI (`ci-pr.yml`) on every PR and are **required** — `main`'s
branch ruleset requires a PR plus the `Syntax & Lint` status check before
merging (see `docs/decisions/0002`). Direct pushes to `main` are rejected.

To confirm a host or home actually evaluates and builds (not just formats and
type-checks):

```sh
nix build .#nixosConfigurations.<host>.config.system.build.toplevel --dry-run
nix build .#homeConfigurations.<home>.activationPackage --dry-run
```

Nothing in CI builds a host or home — run this yourself before opening a PR
for anything beyond a trivial module tweak.

`nix shell nixpkgs#deadnix --command deadnix --exclude result` and
`nix shell nixpkgs#statix --command statix check` also run in CI but are
non-blocking (`continue-on-error: true`) — worth running locally, not a gate.

## Repository conventions

- Add a new module under `modules/<category>/<name>.nix` (or `.../default.nix`
  for a directory module), then reference it from the consuming
  `hosts/<name>/default.nix` / `homes/<name>/default.nix` via
  `lib.imports [ ... "<category>/<name>" ... ]`. Only put a module directly
  under `modules/autoload/` if it must apply unconditionally to every host and
  home — that directory has no explicit import step.
- Add a new host by creating `hosts/<name>/` (with a generated
  `hardware-configuration.nix`) and `homes/<name>/`, then adding both to the
  `x86_64-linux` map in [`flake.nix`](../flake.nix)'s `outputs`. Don't touch
  `bootstrap/` for a routine new-host addition — it's a generator, not
  per-host configuration.
- No secrets live in this repo. Credentials are delegated to the external
  `pass` password store (`programs.git.settings.credential.helper = "pass"`
  in [`modules/common/git.nix`](../modules/common/git.nix)) — don't introduce
  SOPS/age or hardcoded credentials as a pattern here.
- Keep `modules/common/*` and `modules/system/*` shared between both
  machines; put machine-specific config in `hosts/<name>/`/`homes/<name>/`
  directly rather than branching inside a shared module on hostname.
- Renovate config extends the shared `William-Ro/renovate-config` preset and
  the `Renovate` workflow calls the shared `William-Ro/github-workflows`
  reusable workflow — both are intentionally centralized across this user's
  repos. CI validation itself (`ci-pr.yml`) is Nix-specific and stays local to
  this repo; don't propose moving it to `github-workflows` unless a second
  Nix/NixOS repo would actually reuse the same logic.
- Open a PR for every change, mirroring `William-Ro/homelab` — this repo's
  CI is intentionally minimal (just `renovate.yaml` + `ci-pr.yml`), so the PR
  itself, not a build step, is where format/flake-check validation happens.
- Record lasting architectural/operational decisions in
  [`decisions/`](../docs/decisions/README.md); check it before changing
  something that looks wrong — it may be intentional (e.g. the NVIDIA
  `.stable` driver pin in [`hosts/desktop/nvidia.nix`](../hosts/desktop/nvidia.nix)).
- Step-by-step guides for recurring tasks (adding a host, rolling back a bad
  switch) live in [`playbooks/`](../docs/playbooks/README.md) and
  [`runbooks/`](../docs/runbooks/) respectively.
