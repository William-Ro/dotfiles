{
  inputs,
  pkgs,
  system,
  ...
}:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;

    profiles.default = {
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.generation.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.translations.automaticallyPopup" = false;
        "browser.translations.enable" = false;
        "extensions.unifiedExtensions.enabled" = true;
        "media.videocontrols.picture-in-picture.enabled" = false;
      };

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
