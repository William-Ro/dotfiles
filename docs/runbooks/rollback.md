# Rollback: a bad `nixos-rebuild switch` or `home-manager switch`

## Before you touch anything

This repo's `nix.gc` runs weekly and deletes store paths older than 1 week
(`modules/system/nix.nix` — `gc.automatic = true`, `gc.options =
"--delete-older-than 1w"`). **A generation older than ~7 days may already be
garbage-collected and unavailable to roll back to**, even though it still
shows up in the generations list below until the next GC run actually prunes
it. Don't assume last month's generation is still there.

## NixOS system rollback

List generations (newest last):

```sh
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
```

Roll back to the immediately-previous generation and make it the new boot
default, without reboot:

```sh
sudo nixos-rebuild switch --rollback
```

To jump to a specific (not just the previous) generation instead:

```sh
sudo /nix/var/nix/profiles/system-<N>-link/bin/switch-to-configuration switch
```

If the system won't boot at all, select an older generation from the
boot-loader menu at startup (`systemd-boot`, per
[`hosts/desktop/default.nix`](../../hosts/desktop/default.nix) /
[`hosts/laptop/default.nix`](../../hosts/laptop/default.nix) — `timeout = 0`
means you need to hold a key at boot to see the menu at all).

## home-manager rollback

List generations for the current user:

```sh
home-manager generations
```

Each line prints the activation script path for that generation. Activate an
older one directly:

```sh
/nix/store/<hash>-home-manager-generation/activate
```

## Confirm the fix

After rolling back, re-check what broke (`journalctl -b`, `systemctl
--failed`, or the specific symptom that triggered the rollback) before
re-attempting the forward change. CI (`ci-pr.yml`) only validates format and
flake evaluation, not an actual build — nothing automatically catches a
build-breaking change, so re-run the dry-run build commands yourself before
re-applying. See
[ARCHITECTURE.md](../../ARCHITECTURE.md#commands--verification-inventory) for
the full validation command set.

## Permanent fix

Once you've identified the bad change, revert or fix it in Git and re-apply
normally (`os <host>` / `hm <home>` via the `devShells.default` helpers in
[`bootstrap/default.nix`](../../bootstrap/default.nix)) rather than leaving the
machine running an old generation indefinitely — generations you've rolled
back past are still subject to the weekly GC above.
