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
        vscode-extensions.bbenoist.nix
        vscode-extensions.esbenp.prettier-vscode
        vscode-extensions.golang.go
        vscode-extensions.pkief.material-icon-theme
        vscode-extensions.zhuangtongfa.material-theme
        vscode-extensions.dracula-theme.theme-dracula
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
        "terminal.integrated.gpuAcceleration" = "off";
        "terminal.integrated.rendererType" = "dom";
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
        "workbench.activityBar.location" = "hidden";
        "workbench.sideBar.location" = "right";
        "workbench.reduceMotion" = "off";
        "workbench.localHistory.exclude" = {
          "" = true;
          ".angular" = true;
        };
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "Dracula Theme";
        "workbench.iconTheme" = "material-icon-theme";
        "workbench.colorCustomizations" = {
          "[Dracula Theme]" = {
            "editor.background" = "#1F1F1F";
            "sideBar.background" = "#1F1F1F";
            "activityBar.background" = "#1F1F1F";
            "titleBar.activeBackground" = "#1F1F1F";
            "titleBar.inactiveBackground" = "#1F1F1F";
            "statusBar.background" = "#1F1F1F";
            "statusBar.noFolderBackground" = "#1F1F1F";
            "statusBar.debuggingBackground" = "#1F1F1F";
            "panel.background" = "#1F1F1F";
            "terminal.background" = "#1F1F1F";
            "editorGroupHeader.tabsBackground" = "#1F1F1F";
            "tab.activeBackground" = "#1F1F1F";
            "tab.inactiveBackground" = "#1F1F1F";
            "breadcrumb.background" = "#1F1F1F";
            "editorGroup.background" = "#1F1F1F";
            "peekViewEditor.background" = "#1F1F1F";
            "peekViewResult.background" = "#1F1F1F";
            "notifications.background" = "#1F1F1F";
            "scrollbarSlider.background" = "#2A2A2A";
            "scrollbarSlider.hoverBackground" = "#3A3A3A";
            "scrollbarSlider.activeBackground" = "#4A4A4A";
          };
        };

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
        "[xml]" = {
          "editor.defaultFormatter" = "DotJoshJohnson.xml";
        };
        "[csharp]" = {
          "editor.defaultFormatter" = "ms-dotnettools.csharp";
        };
        "[go]" = {
          "editor.defaultFormatter" = "golang.go";
        };
      };
    };
  };
}
