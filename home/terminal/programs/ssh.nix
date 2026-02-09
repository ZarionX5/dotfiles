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
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
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
          sendEnv = [ ];
          serverAliveInterval = 60;
          serverAliveCountMax = 3;
          setEnv = { };
          userKnownHostsFile = "~/.ssh/known_hosts";
        };
      };
    };
  };
}