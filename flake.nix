{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };
  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        ./configuration.nix
 	{
	  nix = {
	    settings.experimental-features = [ "nix-command" "flakes"];
	  };
	}     
      ];
    };
  };
}
