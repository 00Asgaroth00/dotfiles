{ config, lib, pkgs, username, ... }: let
  dtcwVersion = "3.4.1";
in {

  imports = [
    ./capabilities/cli
    ./capabilities/common/xdg
  ];

  fonts.fontconfig.enable = true;
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  # home.username = "vzhsxn";
  # home.homeDirectory = "/home/vzhsxn";
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  # Enable this option on NON-NIXOS distributions
  targets.genericLinux.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    wget
    curl
    ouch # archive tool
    wslu # wsl utilities see https://github.com/wslutilities/wslu
    handlr-regex # mimetype execuitir see https://github.com/Anomalocaridid/handlr-regex
    yt-dlp
    pwgen # tool for generating passwords
    rsync
    lftp
    # fontconfig
    # nerdfonts
    # noto-fonts
    # noto-fonts-color-emoji
    # inter
    # hack-font

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    
    # Helper for yazi spawning media player
    (writeShellScriptBin "mpv" (builtins.readFile ./scripts/mpv))
    (writeShellScriptBin "dtcw" (builtins.readFile ./scripts/doctoolchain/dtcw-v${dtcwVersion}))
    # below is better written with writeShellApplication
    # (writeShellScriptBin "dtcw" (fetchFromGitHub {owner = "doctoolchain"; repo = "doctoolchain"; rev = "v3.3.1"; sha256 = "sha256-H3NBOvc7d7myV3Bapz9o/IV3tjRXktMqOL9Irll4leY=";} + "/dtcw"))
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/vzhsxn/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    LIBVA_DRIVER_NAME = "d3d12";  # only enable this if you have mesa/libva-mesa-driver installed (wsl gpu hardware acceleration)
    # EDITOR = "emacs";
  };

  systemd.user.tmpfiles.rules = [
    # below should be put in /etc/tmpfiles.d/wslg.conf
    # "L+ /tmp/.X11-unix - - - - /mnt/wslg/.X11-unix"

    "L+ ${config.home.homeDirectory}/Documents - - - - /mnt/d/SyncThing/Workstation/Documents"
    "L+ ${config.home.homeDirectory}/Downloads - - - - /mnt/d/SyncThing/Downloads"
    "L+ ${config.home.homeDirectory}/Music - - - - /mnt/d/SyncThing/Music"
    "L+ ${config.home.homeDirectory}/Pictures - - - - /mnt/d/SyncThing/Photos"
    "L+ ${config.home.homeDirectory}/Videos - - - - /mnt/d/SyncThing/Video"
    "L+ ${config.home.homeDirectory}/Work - - - - /mnt/d/SyncThing/Work"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
