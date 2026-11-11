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
- [.github/instructions/nix-modules.instructions.md](.github/instructions/nix-modules.instructions.md) —
  scoped conventions for Nix host/home/module files specifically.
- [.github/instructions/pr-workflow.instructions.md](.github/instructions/pr-workflow.instructions.md) —
  how to carry a change through to an open PR.
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

Both run in CI (`ci-pr.yml`) on every PR and are **required status checks** on
`main` (see `docs/decisions/`) — a PR can't merge until `Syntax & Lint` passes.

For anything beyond a trivial module tweak, also confirm the affected
host/home actually builds — **nothing in CI builds anything**, so this is on
you before opening a PR:

```sh
nix build .#nixosConfigurations.<host>.config.system.build.toplevel --dry-run
nix build .#homeConfigurations.<home>.activationPackage --dry-run
```

## Authority gate

Before changing anything with no already-stated-correct answer — a package
version, a module's internal option values, which modules a host/home
imports, hardware-adjacent settings — confirm the choice is already settled
by an existing convention, an instructions file, or a record in
`docs/decisions/`. A configurable default, or "it happened to be set this
way," is **not** authority. If no settled answer exists, stop and ask instead
of inventing one.

## Working with git

See [.github/instructions/pr-workflow.instructions.md](.github/instructions/pr-workflow.instructions.md)
for the branch/commit/push/PR workflow and Conventional Commits format.

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
