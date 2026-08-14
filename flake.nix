{
	description = "Main config";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};
	outputs = { self, nixpkgs, home-manager, ... }@inputs : {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				./hardware-configuration.nix
			];
		};
	};
}
