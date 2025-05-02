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
      settings = {
        "browser.startup.homepage" = "https://william-ro.github.io/startpage/";
        "media.videocontrols.picture-in-picture.enabled" = false;
        "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
        "ui.key.menuAccessKeyFocuses" = false;
        "identity.fxaccounts.enabled" = false;
        "signon.rememberSignons" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
      };
    };
  };
}
