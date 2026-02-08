{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.vscode = {
    enable = true;
    package = vscode.fhs;

    profiles.default = {
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        kamadorueda.alejandra
        bbenoist.nix
        esbenp.prettier-vscode
        pkief.material-icon-theme
        zhuangtongfa.material-theme
        dracula-theme.theme-dracula
        # GitHub Copilot extensions
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
        "extensions.ignoreRecommendations" = true;
        "extensions.autoUpdate" = true;
        "security.workspace.trust.untrustedFiles" = "open";
        "debug.console.fontSize" = 21;
        "debug.console.fontFamily" = "${config.font}";
        "debug.internalConsoleOptions" = "openOnSessionStart";
        "chat.viewSessions.enabled" = false;
      };
    };
  };
}
