{...}: {
  programs.lazygit = {
    enable = true;

    settings = {
      git = {
        paging = {
          colorArg = "always";
          pager = "delta --color-only --dark --paging=never";
        };
      };
    };
  };
}
