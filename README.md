# dotfiles

![Made with trial and error](https://img.shields.io/badge/Made%20with-trial%20and%20error-blue?style=flat-square&logo=haskell)
[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat-square&logo=NixOS&logoColor=white)](https://nixos.org)

❄️ Nix flake dotfiles

## Manual Commands

After running the flake, execute these commands manually:

1. Configure the display (using `displayplacer`):

   ```bash
   displayplacer "id:3683B5C8-F3EE-2AB8-0857-D6964E3302DB res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0"
   ```

2. Disable Gatekeeper:
   ```bash
   sudo spctl --master-disable
   ```

## Additional Notes

- Ensure your user has administrative privileges on macOS.
- If you encounter issues with the configurations, check the Nix-Darwin logs and your system settings.

## Useful Resources

- [Official Nix Documentation](https://nixos.org/manual/nix/stable/)
- [Nix-Darwin Documentation](https://github.com/LnL7/nix-darwin)
