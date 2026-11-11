# Playbooks

Step-by-step guides for recurring tasks in this repo. These are distinct from
the other two `docs/` categories:

- [`decisions/`](../decisions/README.md) record _why_ a tradeoff was made.
- [`runbooks/`](../runbooks/) cover _recovering_ when a `nixos-rebuild`/
  `home-manager switch` left a machine broken.
- Playbooks below cover _how to build_ something new, following the
  conventions already established in the repo.

| Playbook | Purpose |
| --- | --- |
| [add-new-host.md](add-new-host.md) | Add a new machine (NixOS host + home-manager profile) to the flake. |
| [add-new-module.md](add-new-module.md) | Add a new shared or always-on Nix module. |
