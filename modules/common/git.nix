{
  config,
  lib,
  ...
}:
{
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    rm -f ~/.gitconfig
  '';

  home.activation.setupAllowedSigners = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    key_file="$HOME/.ssh/id_ed25519_sk.pub"
    signers_file="$HOME/.ssh/allowed_signers"
    email="${config.git_usermail}"

    if [ -f "$key_file" ]; then
      echo "$email $(cat "$key_file")" > "$signers_file"
    fi
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519_sk.pub";
      signByDefault = true;
    };

    settings = {
      user.name = config.git_username;
      user.email = config.git_usermail;

      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      pull.rebase = true;
      credential.helper = "pass";

      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };

    includes = lib.optionals (builtins.pathExists (config.home_path + "/Work/.gitconfig")) [
      {
        path = "${config.home_path}/Work/.gitconfig";
        condition = "gitdir:${config.home_path}/Work/";
      }
    ];

    settings.alias = {
      br = "branch";
      co = "checkout";
      st = "status";
      ls = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate";
      ll = "log --pretty=format:\"%C(yellow)%h%Cred%d\\\\ %Creset%s%Cblue\\\\ [%cn]\" --decorate --numstat";
      cm = "commit -m";
      ca = "commit -am";
      dc = "diff --cached";
      amend = "commit --amend -m";

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
