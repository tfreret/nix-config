{
  flake.modules.homeManager.cpp =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        clang
        llvm
        lldb
        cmake
        ninja
        pkg-config
      ];
    };
}
