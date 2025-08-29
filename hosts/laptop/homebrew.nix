{
  config,
  lib,
  ...
}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  ##########################################################################
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true; # Fetch the newest stable branch of Homebrew's git repo
      upgrade = true; # Upgrade outdated casks, formulae, and App Store apps
      # 'zap': uninstalls all formulae(and related files) not listed in the generated Brewfile
      cleanup = "zap";
    };

    # Applications to install from Mac App Store using mas.
    # You need to install all these Apps manually first so that your apple account have records for them.
    # otherwise Apple Store will refuse to install them.
    # For details, see https://github.com/mas-cli/mas
    masApps = {
      #Xcode = 497799835;
      HiddenBar = 1452453066;
      OneThing = 1604176982;
      WhatsApp = 310633997;
    };

    taps = [
      "nikitabobko/tap"
      "hashicorp/tap"
    ];

    # `brew install`

    brews = [
      "mas" # Mac App Store CLI
      #"cocoapods" # dependency manager
      "hashicorp/tap/terraform"
      "displayplacer" # CLI for display settings
    ];

    # `brew install --cask`
    casks = [
      #"android-studio" # IDE for Android development
      "insomnia" # REST client¡
      "qbittorrent" # torrent client
      "raycast" # app launcher
      "ghostty" # terminal emulator
      "spotify" # music player
      "iina" # video player
      "microsoft-teams"
      "docker"
    ];
  };
}
