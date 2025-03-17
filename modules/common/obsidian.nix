{pkgs, ...}: {
  home.packages = [
    pkgs.obsidian
  ];
  home.file."Obsidian/.obsidian/themes/deishuu.css".text = ''
      .theme-dark {
      --background-primary: #000;
      --background-secondary: #000;
      --titlebar-background-focused: #000;
    }

  '';
}
