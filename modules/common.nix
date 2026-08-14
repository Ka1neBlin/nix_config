{ config, pkgs, ... }:
{
	services.displayManager.sddm = {
		enable = true;
		wayland.enable = true;
	};
	programs.zsh = {
		enable = true;
		ohMyZsh = {
			enable = true;
			plugins = [
				"git"
			];
#			theme = "robbyrussel";
		};
		promptInit = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
	};
	fonts.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];
	#programs.neovim = {
	#	enable = true;
	#	defaultEditor = true;
	#};
	programs.nixvim = {
		enable = true;
		colorschemes.kanagawa.enable = true;
		plugins.lualine.enable = true;
		globals.mapleader = " ";
		plugins = {
			neo-tree.enable = true;
		};
		keymaps = [
			{
				key = "<leader>e";
				action = "<cmd>Neotree toggle<CR>";
				options = {
					desc = "Toggle Tree View";
				};
			}
		];
	};
	programs.noctalia = {
		enable = true;
	};
	programs.yazi.enable = true;
}
