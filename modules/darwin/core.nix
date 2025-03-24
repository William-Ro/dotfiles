{pkgs, ...}: {
  home.packages = with pkgs; [
    dotnet-sdk_8
    dotnet-ef
  ];
  programs = {
  };
}
