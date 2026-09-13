{ config, pkgs, ... }:
{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
		withUWSM = true;
	};
    programs.qylock = {
        enable = true;
        theme = "nier-automata";
    };
}
