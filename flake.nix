{
	description = "Main config";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-26.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		noctalia = {
			url = "github:noctalia-dev/noctalia";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};
        # hardware = {
        #     url = "path:/etc/nixos/hardware-configuration.nix";
        #     flake = false;
        # };
	};
	outputs = { self, nixpkgs, home-manager, nixvim, /* hardware, */ ... }@inputs : {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				./hardware-configuration.nix
				nixvim.nixosModules.nixvim
                # (import /etc/nixos/hardware-configuration.nix)
			];
		};
		homeConfigurations."yoel" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.x86_64-linux;
			modules = [
				./home.nix
			];
		};
	};
}
