{
  nixosModule = { user, ... }: {
    age.secrets.aws_config = {
      file = ../secrets/aws_config.age;
      path = "/home/${user}/.aws/config";
      owner = user;
    };
  };

  hmModule = { pkgs, ... }: {
    home.packages = builtins.attrValues {
      inherit (pkgs) awscli2 aws-vault mongodb-tools slack;
      inherit (pkgs.gnome) zenity;
    };

    programs.vscode.extensions = [
      pkgs.vscode-extensions.ethansk.restore-terminals
      pkgs.vscode-extensions.rioj7.commandOnAllFiles
    ];

    programs.vscode.userSettings = {
      "restoreTerminals.keepExistingTerminalsOpen" = true;
      "commandOnAllFiles.commands"."Trailing Spaces: Delete" = {
        "command" = "trailing-spaces.deleteTrailingSpaces";
        "includeFileExtensions" = [ ".js" ".json" ];
      };
    };
  };
}
