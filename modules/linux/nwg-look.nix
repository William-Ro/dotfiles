{
  config,
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nwg-look
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark";
      package = pkgs.graphite-gtk-theme.override {
        tweaks = ["darker"];
        themeVariants = ["default"];
        colorVariants = ["dark"];
      };
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 23;
    };
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  xdg.configFile."xsettingsd/xsettingsd.conf".text = ''
    Net/ThemeName "Graphite-Dark"
    Net/IconThemeName "Graphite-Dark"
    Gtk/CursorThemeName "Bibata-Modern-Classic"
    Net/EnableEventSounds 1
    EnableInputFeedbackSounds 0
    Xft/Antialias 1
    Xft/Hinting 1
    Xft/HintStyle "hintslight"
    Xft/RGBA "rgb"
  '';
}
