{
  pkgs,
  ...
}:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    configPath = ".mozilla/firefox";

    profiles.default = {
      settings = {
        "ui.key.menuAccessKeyFocuses" = false;
        "signon.rememberSignons" = false;
        "signon.autofillForms" = false;
        "signon.generation.enabled" = false;
        "browser.formfill.enable" = false;
        "browser.translations.automaticallyPopup" = false;
        "browser.translations.enable" = false;
        "media.videocontrols.picture-in-picture.enabled" = false;
      };
    };
  };
}
