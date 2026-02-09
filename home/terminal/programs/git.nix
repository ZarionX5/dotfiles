{
  config,
  pkgs,
  vars,
  lib,
  ...
}:
{
  home.sessionVariables.DELTA_PAGER = "less -R";

  programs.git = {
    enable = true;

    ignores = [
      "*~"
      "*.swp"
      "*result*"
      ".direnv"
      "node_modules"
    ];

    settings = let 
      hasGpg = (vars.git ? signingKey) && (vars.git.signingKey != "");
    in {
      core = {
        editor = "${config.home.sessionVariables.EDITOR}";
        pager = "${pkgs.delta}/bin/delta";
        whitespace = "fix,-indent-with-non-tab,trailing-space,cr-at-eol";
      };

      init = {
        defaultBranch = "main";
      };
      
      user = {
        email = "${vars.git.email}";
        name = "${vars.git.name}";
      } 
      // lib.optionalAttrs hasGpg { 
        signingKey = "${vars.git.signingKey}"; 
      };

      gpg = {
        format = "openpgp";
      };

      "gpg-openpgp" = {
        program = "${pkgs.gnupg}/bin/gpg";
      };

      tag = {
        gpgSign = hasGpg;
      };

      commit = {
        gpgSign = hasGpg;
      };

      merge ={
        conflictstyle = "diff3";
      };

      diff ={
        colorMoved = "default";
      };

      alias =
      let
        log = "log --show-notes='*' --abbrev-commit --pretty=format:'%Cred%h %Cgreen(%aD)%Creset -%C(bold red)%d%Creset %s %C(bold blue)<%an>% %Creset' --graph";
      in
      {
        a = "add --patch";
        ad = "add";

        b = "branch";
        ba = "branch -a";
        bd = "branch --delete";
        bdd = "branch -D";

        c = "commit";
        ca = "commit --amend";
        cm = "commit --message";

        co = "checkout";
        cb = "checkout -b";
        pc = "checkout --patch";

        cl = "clone";

        d = "diff";
        ds = "diff --staged";

        h = "show";
        h1 = "show HEAD^";
        h2 = "show HEAD^^";
        h3 = "show HEAD^^^";
        h4 = "show HEAD^^^^";
        h5 = "show HEAD^^^^^";

        p = "push";
        pf = "push --force-with-lease";

        pl = "pull";

        l = log;
        lp = "${log} --patch";
        la = "${log} --all";

        r = "rebase";
        ra = "rebase --abort";
        rc = "rebase --continue";
        ri = "rebase --interactive";

        rs = "reset";
        rsh = "reset --hard";

        s = "status --short --branch";
        ss = "status";

        st = "stash";
        stc = "stash clear";
        sth = "stash show --patch";
        stl = "stash list";
        stp = "stash pop";

        forgor = "commit --amend --no-edit";
        oops = "checkout --";
      };
    };
    includes = 
    lib.optionals (vars ? git && vars.git ? github) [{
        condition = "hasconfig:remote.*.url:git@github.com:*/**";
        contents = {
          user = {
            email = vars.git.github.email;
            name = vars.git.github.name;
            signingKey = vars.git.github.signingKey;
          };
        };
      }
    ] ++ lib.optionals (vars ? git && vars.git ? gitlab) [{
        condition = "hasconfig:remote.*.url:git@gitlab.com:*/**";
        contents = {
          user = {
            email = vars.git.gitlab.email;
            name = vars.git.gitlab.name;
            signingKey = vars.git.gitlab.signingKey;
          };
        };
      }
    ];
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options.dark = true;
  };
}