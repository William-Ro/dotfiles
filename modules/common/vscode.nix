{
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        esbenp.prettier-vscode
        pkief.material-icon-theme
        dracula-theme.theme-dracula
        github.copilot
        github.copilot-chat
      ];
      userSettings = {
        "window.zoomLevel" = 2;
        "workbench.activityBar.location" = "hidden";
        "workbench.sideBar.location" = "right";
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "Dracula Theme";
        "workbench.iconTheme" = "material-icon-theme";

        "editor.fontFamily" = "${config.font}";
        "editor.fontSize" = 21;
        "editor.fontWeight" = "normal";
        "editor.fontLigatures" = true;
        "editor.renderLineHighlight" = "gutter";
        "editor.minimap.enabled" = false;
        "editor.renderWhitespace" = "all";
        "editor.stickyScroll.enabled" = false;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "phase";
        "editor.cursorStyle" = "line";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };
        "editor.wordWrap" = "on";
        "editor.bracketPairColorization.enabled" = true;
        "editor.smoothScrolling" = true;
        "editor.tabSize" = 2;

        "terminal.integrated.fontFamily" = "${config.font}";
        "terminal.integrated.fontSize" = 21;
        "terminal.integrated.shellIntegration.decorationsEnabled" = "never";
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorBlinking" = false;
        "terminal.integrated.gpuAcceleration" = "on";
        "terminal.integrated.allowedLinkSchemes" = [
          "file"
          "http"
          "https"
          "mailto"
          "vscode"
          "vscode-insiders"
          "docker-desktop"
        ];

        "explorer.confirmDragAndDrop" = false;
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.fileNesting.enabled" = true;
        "explorer.fileNesting.patterns" = {
          "*.js" = "$(capture).*";
          "*.jsx" = "$(capture).*";
          "*.ts" = "$(capture).*";
          "*.tsx" = "$(capture).*";
        };

        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders" = "always";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = true;
          "markdown" = true;
          "scminput" = false;
        };
        "github.copilot.inlineSuggest.enable" = true;

        "files.insertFinalNewline" = true;
        "json.schemaDownload.trustedDomains" = {
          "https://developer.microsoft.com/json-schemas/" = true;
          "https://docs.renovatebot.com/renovate-schema.json" = true;
          "https://json-schema.org/" = true;
          "https://json.schemastore.org/" = true;
          "https://raw.githubusercontent.com/devcontainers/spec/" = true;
          "https://raw.githubusercontent.com/microsoft/vscode/" = true;
          "https://schemastore.azurewebsites.net/" = true;
          "https://www.schemastore.org/" = true;
        };
        "extensions.ignoreRecommendations" = true;
        "extensions.autoUpdate" = true;
        "security.workspace.trust.untrustedFiles" = "open";
        "debug.console.fontSize" = 21;
        "debug.console.fontFamily" = "${config.font}";
        "debug.internalConsoleOptions" = "openOnSessionStart";
        "chat.viewSessions.enabled" = false;
        "chat.mcp.gallery.enabled" = true;
        "update.mode" = "none";
        "yaml.customTags" = [ "!env_var scalar" ];
      };
    };
  };

  # Before home-manager checks for link conflicts, remove any mutable copies
  # so home-manager can place fresh symlinks
  home.activation.vscodePrepareFiles = lib.hm.dag.entryBefore [ "checkLinkTargets" ] ''
    for f in settings.json mcp.json; do
      p="${config.xdg.configHome}/Code/User/$f"
      if [ -f "$p" ] && [ ! -L "$p" ]; then
        $DRY_RUN_CMD rm "$p"
      fi
    done
  '';

  # After home-manager places symlinks, convert them to mutable copies
  # so VS Code can write to them without EROFS errors
  home.activation.vscodeMutableFiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    for f in settings.json mcp.json; do
      p="${config.xdg.configHome}/Code/User/$f"
      if [ -L "$p" ]; then
        $DRY_RUN_CMD cp --remove-destination "$(readlink -f "$p")" "$p"
      fi
    done
  '';

  home.file.".config/Code/User/mcp.json".text = builtins.toJSON {
    servers = {
      nixos = {
        type = "stdio";
        command = "/home/deishuu/.nix-profile/bin/uvx";
        args = [ "mcp-nixos" ];
      };
      github = {
        type = "http";
        url = "https://api.githubcopilot.com/mcp/";
      };
      grafana = {
        url = "https://grafana-mcp.internal.reli.cc/sse";
        type = "http";
      };
      flux = {
        url = "https://flux-mcp.internal.reli.cc/mcp";
        type = "http";
      };
      graphify = {
        type = "stdio";
        command = "/home/deishuu/.nix-profile/bin/uvx";
        args = [ "--from" "graphifyy" "graphify-mcp" ];
      };
    };
    inputs = [ ];
  };
}
