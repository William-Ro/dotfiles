{ ... }:
{
  programs.lazygit = {
    enable = true;

    settings = {
      git = {
        diffRenderers = [
          {
            colorArg = "always";
            command = "delta --color-only --dark --paging=never";
          }
        ];
      };
    };
  };
}
