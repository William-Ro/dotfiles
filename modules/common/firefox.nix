{
  inputs,
  pkgs,
  system,
  ...
}: {
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-bin;

    profiles.default = {
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          bitwarden
          clearurls
          new-tab-override
          darkreader
          fastforwardteam
          hover-zoom-plus
          istilldontcareaboutcookies
          privacy-badger
          sponsorblock
          ublock-origin
        ];
      };
    };
  };
}
