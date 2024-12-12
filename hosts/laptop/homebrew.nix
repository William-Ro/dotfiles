{username, ...}: {
  ##########################################################################
  #
  #  Install all apps and packages here.
  #
  ##########################################################################

  # Add nix-homebrew configuration
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = username;
    autoMigrate = true;
  };
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
      Xcode = 497799835;
      HiddenBar = 1452453066;
      OneThing = 1604176982;
    };

    taps = [
      "homebrew/services"
      "nikitabobko/tap"
    ];

    # `brew install`

    brews = [
      "wget" # download tool
      "curl" # no not install curl via nixpkgs, it's not working well on macOS!
      "mas" # Mac App Store CLI
      "cocoapods" # dependency manager for Swift and Objective-C projects
    ];

    # `brew install --cask`
    casks = [
      "firefox" # web browser
      "brave-browser" # web browser
      "raycast" # app launcher
      "aerospace" # window manager
      "visual-studio-code" # code editor
      "spotify" # music player
      "iina" # video player
      "insomnia" # REST client
      "karabiner-elements" # keyboard customizer
    ];
  };
}
