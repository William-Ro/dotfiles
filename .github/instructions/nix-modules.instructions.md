---
applyTo: "hosts/**/*.nix,homes/**/*.nix,modules/**/*.nix,bootstrap/**/*.nix"
description: "Repository-specific conventions for Nix host, home-manager, and module files"
---

# Nix hosts, homes, and modules

- Add a new module under `modules/<category>/<name>.nix` (or `.../default.nix` for a directory module); reference it from the consuming `hosts/<name>/default.nix` / `homes/<name>/default.nix` via `lib.imports [ ... "<category>/<name>" ... ]`. Only place a module directly under `modules/autoload/` if it must apply unconditionally to every host and home — that directory has no explicit import step.
- Keep `modules/common/*` and `modules/system/*` shared between both machines; put machine-specific config in `hosts/<name>/`/`homes/<name>/` directly rather than branching inside a shared module on hostname.
- Add a new host by creating `hosts/<name>/` (with a generated `hardware-configuration.nix`) and `homes/<name>/`, then add both to the `x86_64-linux` map in `flake.nix`'s `outputs`. Don't touch `bootstrap/` for a routine new-host addition — it's a generator, not per-host configuration.
- Never hand-write `hosts/<name>/hardware-configuration.nix` — it's machine-generated via `nixos-generate-config` and not reproducible from this repo alone.
- No secrets live in this repo; credentials are delegated to the external `pass` password store (`programs.git.settings.credential.helper = "pass"`). Don't introduce SOPS/age or hardcoded credentials as a pattern here.
- Format with `nix fmt` (or `nix shell nixpkgs#nixfmt --command nixfmt <file>`) before committing — this is the exact formatter the flake exposes as its `formatter` output, the same one `ci-pr.yml`'s `nixfmt --check` enforces.
- Validate with `nix flake check --no-build`, and for anything beyond a trivial tweak also `nix build .#nixosConfigurations.<host>.config.system.build.toplevel --dry-run` / `.#homeConfigurations.<home>.activationPackage --dry-run` — nothing in CI does this for you.
