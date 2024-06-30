{ pkgs, ...}: {

  home.packages = with pkgs; [
    socat
  ];

  programs.ssh = {
    enable = true;
    package = pkgs.openssh;
    serverAliveInterval = 10;
    matchBlocks = {
      bfiemgmt01 = {
        hostname = "bfiemgmt01.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfiemgmt02 = {
        hostname = "bfiemgmt02.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfiesbc01 = {
        hostname = "bfiesbc01.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfiesbc02 = {
        hostname = "bfiesbc02.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfielb01 = {
        hostname = "bfielb01.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfielb02 = {
        hostname = "bfielb02.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      gcems1 = {
        hostname = "gcems1.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      gcems2 = {
        hostname = "gcems2.prod.blueface.com";
	port = 22;
	user = "vzhsxn";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	  KexAlgorithms = "+diffie-hellman-group1-sha1";
	};
      };
      bfieesx10 = {
        hostname = "bfieesx10.cons.blueface.com";
	port = 22;
	user = "root";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	};
      };
      bfieesx11 = {
        hostname = "bfieesx11.cons.blueface.com";
	port = 22;
	user = "root";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	};
      };
      bfieesx12 = {
        hostname = "bfieesx12.cons.blueface.com";
	port = 22;
	user = "root";
	extraOptions = {
	  HostkeyAlgorithms = "+ssh-rsa";
	  PubkeyAcceptedKeyTypes = "+ssh-rsa";
	};
      };
    };
  };

  services.ssh-agent.enable = true;

}
