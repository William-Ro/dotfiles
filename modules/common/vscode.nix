{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;

    profiles.default = {
      enableUpdateCheck = false;

      extensions = with pkgs; [
        vscode-extensions.github.copilot
        vscode-extensions.kamadorueda.alejandra
        vscode-extensions.dart-code.dart-code
        vscode-extensions.ms-vscode-remote.remote-containers
        vscode-extensions.ms-azuretools.vscode-docker
        vscode-extensions.dart-code.flutter
        vscode-extensions.github.copilot-chat
        vscode-extensions.pkief.material-icon-theme
        vscode-extensions.bbenoist.nix
        vscode-extensions.zhuangtongfa.material-theme
        vscode-extensions.esbenp.prettier-vscode
      ];

      userSettings = {
        "editor.fontFamily" = "JetBrainsMono Nerd Font";
        "editor.fontSize" = 21;
        "editor.fontWeight" = "normal";
        "editor.fontLigatures" = true;
        "editor.fontVariations" = false;
        "editor.renderLineHighlight" = "gutter";
        "editor.minimap.enabled" = false;
        "editor.guides.bracketPairs" = "active";
        "editor.renderWhitespace" = "all";
        "editor.stickyScroll.enabled" = false;
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.cursorBlinking" = "phase";
        "editor.cursorStyle" = "line";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "editor.parameterHints.enabled" = false;
        "editor.codeActionsOnSave" = {
          "source.fixAll.eslint" = "explicit";
        };
        "editor.wordWrap" = "on";
        "editor.bracketPairColorization.enabled" = true;
        "editor.smoothScrolling" = true;
        "editor.tabSize" = 2;
        "terminal.integrated.fontFamily" = "JetBrainsMono Nerd Font";
        "terminal.integrated.fontSize" = 21;
        "terminal.integrated.cursorStyle" = "line";
        "terminal.integrated.cursorBlinking" = false;
        "terminal.integrated.stickyScroll.enabled" = false;
        "terminal.integrated.allowedLinkSchemes" = [
          "file"
          "http"
          "https"
          "mailto"
          "vscode"
          "vscode-insiders"
          "docker-desktop"
        ];
        "files.insertFinalNewline" = true;
        "explorer.compactFolders" = false;
        "explorer.confirmDelete" = false;
        "explorer.confirmPasteNative" = false;
        "explorer.confirmDragAndDrop" = false;
        "explorer.fileNesting.enabled" = true;
        "explorer.fileNesting.patterns" = {
          "*.js" = "$(capture).*";
          "*.jsx" = "$(capture).*";
          "*.ts" = "$(capture).*";
          "*.tsx" = "$(capture).*";
        };
        "files.exclude" = {
          ".angular" = true;
          ".vscode" = true;
          ".dart_tool" = true;
          ".idea" = true;
          ".vscode-test" = true;
          "bower_components" = true;
          "node_modules" = true;
          "build" = true;
        };
        "search.exclude" = {
          "**/node_modules" = true;
          "**/bower_components" = true;
        };
        "workbench.activityBar.location" = "hidden";
        "workbench.sideBar.location" = "right";
        "workbench.reduceMotion" = "off";
        "workbench.localHistory.exclude" = {
          "" = true;
          ".angular" = true;
        };
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "One Dark Pro Darker";
        "workbench.iconTheme" = "material-icon-theme";
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.openRepositoryInParentFolders" = "always";
        "github.copilot.enable" = {
          "*" = true;
          "plaintext" = true;
          "markdown" = false;
          "scminput" = false;
        };
        "github.copilot.editor.enableAutoCompletions" = true;
        "javascript.updateImportsOnFileMove.enabled" = "always";
        "typescript.updateImportsOnFileMove.enabled" = "always";
        "json.schemas" = [];
        "extensions.ignoreRecommendations" = true;
        "extensions.autoCheckUpdates" = true;
        "extensions.autoUpdate" = true;
        "security.workspace.trust.untrustedFiles" = "open";
        "debug.console.fontSize" = 21;
        "debug.console.fontFamily" = "JetBrainsMono Nerd Font";
        "debug.internalConsoleOptions" = "openOnSessionStart";
        "[dart]" = {
          "editor.formatOnSave" = true;
          "editor.formatOnType" = true;
          "editor.selectionHighlight" = false;
          "editor.tabCompletion" = "onlySnippets";
          "editor.wordBasedSuggestions" = "off";
        };
      };
    };
  };
}
