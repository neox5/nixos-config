{
  description = "Minos system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }: 
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      conifg = { allowUnfree = false; }; # enable this when you want to install for example Spotify, Nvidia drivers, vscode, etc.
    };
    lib = nixpkgs.lib;
  in 
  {
    homeManagerConfigurations = {
      neox5 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [
          ./home.nix
	  {
	    home = {
	      username = "neox5";
	      homeDirectory = "/home/neox5";
	      stateVersion = "23.11";
	    };
	  }
	];
      };
    };

    nixosConfigurations = {
      minos = lib.nixosSystem {
        inherit system;

	modules = [
          ./configuration.nix
	];
      };
    };
  };
}
