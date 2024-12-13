# Nix-Darwin Configuration

This repository contains my automated configuration for Nix-Darwin on macOS. The flake is designed to automate most configurations, but there are two commands that need to be executed manually due to current limitations:

```bash
displayplacer "id:3683B5C8-F3EE-2AB8-0857-D6964E3302DB res:2560x1440 hz:144 color_depth:8 scaling:off origin:(0,0) degree:0"

sudo spctl --master-disable
```

## Notes on Display Configuration

The display configuration is specific to the USB hub I use, which only supports 144 Hz. If you are not using a hub with these characteristics, this step might not be necessary.

## Prerequisites

1. Installed macOS.
2. Internet access.

## Step-by-Step Installation

### Step 1: Install Nix

Run the following command to install Nix:

```bash
sh <(curl -L https://nixos.org/nix/install)
```

### Step 2: Install Git

On macOS, install Git by downloading Apple’s Command Line Tools. This can be done by running:

```bash
xcode-select --install
```

### Step 3: Clone the Repository

Clone this repository to get the configuration files:

```bash
git clone https://github.com/William-Ro/dotfiles
cd dotfiles
```

### Step 4: Apply the Configuration

Run the following command to apply the configuration:

```bash
nix run nix-darwin --extra-experimental-features 'nix-command flakes' -- switch --flake .#laptop
```

## Compatibility with NixOS

In addition to macOS, this configuration can also be used on NixOS systems. Make sure to adapt the macOS-specific steps as needed.

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
- [displayplacer](https://github.com/jakehilborn/displayplacer)
