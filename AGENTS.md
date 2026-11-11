# Agent Instructions

This is a **personal Nix flake repository** — a single flake declaring NixOS
system configurations and home-manager user configurations for two physical
machines (`desktop`, `laptop`). There is no running application and no
production deployment; "deploying" means a host-side `nixos-rebuild switch`
or `home-manager switch`, run manually by the user.

This file is a short router. It applies to any coding agent (Copilot, Claude
Code, Codex, Cursor, etc.), not just one tool.

## Start here

- [ARCHITECTURE.md](ARCHITECTURE.md) — full technical deep-dive: tech stack,
  directory layout, the `bootstrap/` flake-output generator, module
  composition, known gotchas.
- [.github/copilot-instructions.md](.github/copilot-instructions.md) — repo
  conventions and validation commands. Read before editing anything under
  `hosts/`, `homes/`, `modules/`, or `bootstrap/`.
- [decisions/](docs/decisions/README.md) — lasting decisions and their
  rationale. Check here before "fixing" something that looks wrong; it may be
  intentional (e.g. a driver version pin).
- [runbooks/](docs/runbooks/) — operational recovery procedures (rolling back
  a bad `nixos-rebuild`/`home-manager switch`).
- [playbooks/](docs/playbooks/README.md) — step-by-step guides for recurring
  tasks (adding a host, adding a module).

## Verification

```sh
nix shell nixpkgs#nixfmt --command \
  find . -name "*.nix" -not -path "./.git/*" -not -name "result" -exec nixfmt --check {} +

nix flake check --no-build
```

Both run in CI (`ci-pr.yml`) on every PR, but **neither is a required/blocking
check** — `main`'s only branch rule blocks deletion, not merges without
passing CI. Treat a CI failure as real signal regardless.

For anything beyond a trivial module tweak, also confirm the affected
host/home actually builds — **nothing in CI builds anything**, so this is on
you before opening a PR:

```sh
nix build .#nixosConfigurations.<host>.config.system.build.toplevel --dry-run
nix build .#homeConfigurations.<home>.activationPackage --dry-run
```

## Working with git

Open a PR for every change — that's the adopted convention here (mirroring
`William-Ro/homelab`), even though `main`'s branch ruleset doesn't yet enforce
it (only a deletion-protection rule exists). The repo's history predates this
convention and mixes direct pushes with PR merges, but don't treat that as
license to push directly going forward. Conventional Commits are already the
norm (`fix(nix): ...`, `feat(desktop): ...`, `chore: ...`, `ci: ...`,
`style: ...`, `revert: ...`) — follow that format.

## Stop and ask before

- Changing `system.stateVersion` / `home.stateVersion` on an existing
  host/home — these are compatibility markers, not "current version" fields;
  bumping them is a deliberate, rarely-needed action, not routine maintenance.
- Deleting or overwriting a `hosts/<name>/hardware-configuration.nix` — it's
  machine-generated and not reproducible from this repo alone.
- Changing the NVIDIA driver channel on `desktop`
  ([`hosts/desktop/nvidia.nix`](hosts/desktop/nvidia.nix)) — the current
  `.stable` pin is a documented workaround for a specific crash regression,
  not a default left unconfigured.
- Changing Renovate or CI workflow behavior shared with other repos
  (`.renovaterc.json`'s `extends`, `.github/workflows/renovate.yaml`'s
  `uses:`) — these intentionally point at shared, cross-repo infrastructure.
- Any change where this repo doesn't already state which option is correct.

## Definition of done

A change is done when `nixfmt --check` and `nix flake check --no-build` both
pass locally — not when the Nix looks right. If the change affects a host or
home's actual build output, also confirm the relevant
`nixosConfigurations.<host>.config.system.build.toplevel` or
`homeConfigurations.<home>.activationPackage` builds, since CI only proves
that post-merge here.
