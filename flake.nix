{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  inputs.home-manager.url = github:nix-community/home-manager;

  outputs = inputs:

  let
    nixpkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
      overlays = [
        (import ./overlays/ff2mpv.nix)
        (import ./overlays/i3-ws.nix)
        (import ./overlays/neovim.nix)
        (import ./overlays/shutdown-menu.nix)
        (import ./overlays/vscode-extensions.nix)
      ];
    };
  in {
    nixosConfigurations.zeta-nixos = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      pkgs = nixpkgs;
      modules = [
        ./configuration.nix
        ./hosts/zeta/configuration.nix
        inputs.home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.users.enzime = import ./home.nix;
          home-manager.extraSpecialArgs = {
            hostname = "zeta";
            using = { gnome = true; };
          };
        }
      ];
    };

    homeConfigurations.zeta-nixos = inputs.home-manager.lib.homeManagerConfiguration {
      system = "x86_64-linux";
      pkgs = nixpkgs;
      configuration = import ./home.nix;
      homeDirectory = "/home/enzime";
      username = "enzime";
      extraSpecialArgs = {
        hostname = "zeta";
        using = { gnome = true; };
      };
    };
  };
}
