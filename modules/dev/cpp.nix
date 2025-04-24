{pkgs, ...}: {
  home.packages = with pkgs; [
    clang
    clang-tools
    cmake
    ninja
    gdb
    valgrind
    cppcheck
  ];

  home.sessionVariables = {
    CC = "clang";
    CXX = "clang++";
  };
}
