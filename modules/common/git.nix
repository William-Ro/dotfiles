{
  config,
  lib,
  ...
}: {
  # Asegura que no exista ~/.gitconfig, porque Home Manager generará ~/.config/git/config
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    settings = {
      user.name = config.gitUsername;
      user.email = config.gitUsermail;

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      credential.helper = "pass";
    };

    includes =
      lib.optionals (builtins.pathExists (config.homePath + "/Work/.gitconfig")) [
        {
          path = "${config.homePath}/Work/.gitconfig";
          condition = "gitdir:${config.homePath}/Work/";
        }
      ]
      ++ lib.optionals (builtins.pathExists (config.dotfilesPath + "/.gitconfig")) [
        {
          path = "${config.dotfilesPath}/.gitconfig";
          condition = "gitdir:${config.dotfilesPath}/";
        }
      ];

    settings.alias = {
      # common aliases
      br = "branch";
      co = "checkout";
      st = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      ca = "commit -am";
      dc = "diff --cached";
      amend = "commit --amend -m";

      # aliases for submodule
      update = "submodule update --init --recursive";
      foreach = "submodule foreach";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      features = "side-by-side";
    };
  };
}
