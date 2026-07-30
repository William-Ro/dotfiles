inputs: lib: _:
{
  autoloadedModules =
    let
      optionsDir = ../modules/autoload;
      nixFiles = lib.filterAttrs (n: v: v == "regular" && lib.hasSuffix ".nix" n) (
        builtins.readDir optionsDir
      );
    in
    map (file: optionsDir + "/${file}") (builtins.attrNames nixFiles);

  # Helper to easily import modules in home/system configs
  imports =
    let
      modulePath =
        path:
        if builtins.isPath path then
          # Handle explicit paths
          path
        else if builtins.pathExists ../modules/${path} then
          # Handle directory modules
          ../modules/${path}
        else
          # Otherwise assume it's a .nix module
          ../modules/${path}.nix;
    in
    builtins.map modulePath;
}
# Make sure to add lib extensions from inputs
// inputs.home-manager.lib
