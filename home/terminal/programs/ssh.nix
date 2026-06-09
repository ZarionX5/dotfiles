{
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;

      matchBlocks = {
        "*" = {
          addKeysToAgent = "yes";
          certificateFile = [ ];
          checkHostIP = true;
          compression = false;

          controlMaster = "auto";
          controlPath = "~/.ssh/master-%r@%h:%p";
          controlPersist = "4h";
          
          dynamicForwards = [ ];
          extraOptions = { };
          forwardAgent = false;
          forwardX11 = false;
          forwardX11Trusted = false;
          hashKnownHosts = true;
          identitiesOnly = false;
          identityAgent = [ ];
          identityFile = [ ];
          localForwards = [ ];
          remoteForwards = [ ];
          serverAliveInterval = 60;
          serverAliveCountMax = 3;
          setEnv = {
            TERM="xterm-256color";
          };
          sendEnv = [ "COLORTERM" "TERM_PROGRAM" "TERM_PROGRAM_VERSION" ];
          userKnownHostsFile = "~/.ssh/known_hosts";
        };
      };
    };
  };
}