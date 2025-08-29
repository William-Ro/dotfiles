{
  inputs,
  pkgs,
  system,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.default = {
      extensions = {
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
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
