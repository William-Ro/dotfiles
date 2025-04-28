{
  inputs,
  pkgs,
  system,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles.default = {
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.profiles._name_.containersForce
      containersForce = true;
      # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.firefox.profiles._name_.search.force
      search.force = true;

      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
        bitwarden
        clearurls
        custom-new-tab-page
        darkreader
        fastforwardteam
        hover-zoom-plus
        istilldontcareaboutcookies
        privacy-badger17
        sponsorblock
        ublock-origin
      ];
    };
  };
}
