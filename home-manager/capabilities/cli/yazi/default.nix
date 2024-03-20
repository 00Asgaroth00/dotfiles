{pkgs, ...}: {
  home.packages = with pkgs; [
    file
    # nerdfonts
    ffmpegthumbnailer
    # ueberzugpp
    zoxide
    # xclip
    # xsel
  ];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableZshIntegration = true;
    # keymap = {};
    # settings = {};
    # theme = {};
  };
}
