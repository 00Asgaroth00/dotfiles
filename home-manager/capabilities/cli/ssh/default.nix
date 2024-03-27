{ pkgs, ...}: {

  home.packages = with pkgs; [
    socat
  ];

  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
  };

  services.ssh-agent.enable = true;

}
