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
        qylock.url = "github:Darkkal44/qylock";
	};
	outputs = { self, nixpkgs, home-manager, nixvim, qylock, ... }@inputs : {
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [
				./configuration.nix
				./hardware-configuration.nix
				nixvim.nixosModules.nixvim
                qylock.nixosModules.default
                ./modules/common.nix
                ./modules/graphical.nix
                ./modules/packages.nix
                ./modules/system.nix
                # (import /etc/nixos/hardware-configuration.nix)
			];
		};
		homeConfigurations."yoel" = home-manager.lib.homeManagerConfiguration {
			pkgs = nixpkgs.legacyPackages.x86_64-linux;
			modules = [
				./home.nix
			];
		};
        devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
            buildInputs = with nixpkgs.legacyPackages.x86_64-linux; [
                qt5.qtbase
                qt5.qtmultimedia
                qt5.qtpositioning
                qtcreator
                gcc
                gdb
                gnumake
            ];
        };
	};
}
