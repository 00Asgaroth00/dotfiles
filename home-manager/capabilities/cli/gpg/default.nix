{ pkgs, ... }: {

  
  programs.gpg = {
    enable = true;
    package = pkgs.gnupg;
  };
  
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    enableZshIntegration = true;
  };

}
