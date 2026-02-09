{
  config = {
    webfetch = "allow";
    edit = "ask";
    bash = {
        "* --help" = "allow";
        "* --version" = "allow";
        "man *" = "allow";
        "pwd" = "allow";
        "ls *" = "allow";
        "which *" = "allow";
        "grep *" = "allow";
        "find *" = "allow";
        "cat *" = "allow";
        "git status *" = "allow";
        "git log *" = "allow";
        "git branch -a" = "allow";
        "git branch" = "allow";
        "git *" = "ask";
        "pip list" = "allow";
        "uv pip list" = "allow";
        "python --version" = "allow";
        "python3 --version" = "allow";
        "node -v" = "allow";
        "npm -v" = "allow";
        "npx -v" = "allow";
        "rm *" = "ask";
        "rm -rf /" = "deny";
        "rm -rf ~" = "deny";
        "*" = "ask";
    };
  };
}
