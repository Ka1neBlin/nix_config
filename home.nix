{ config, pkgs, ... }:
{
	home.username = "yoel";
	home.homeDirectory = "/home/yoel";
	home.stateVersion = "24.11";
	wayland.windowManager.hyprland = {
		systemd.enable = false;
		settings = {
			general = {
				gaps_in = 5;
				gaps_out = 20;
				resize_on_border = false;
				allow_tearing = false;
				layout = "dwindle";
			};
			decoration = {
				rounding = 10;
				active_opacity = "0.97";
				inactive_opacity = "0.8";
			};
			input = {
				kb_layout = "us,ru";
				kb_options = "grp:win_space_toggle";
			};
			"$mod" = "SUPER";
			"$terminal" = "kitty";
			"$browser" = "firefox";
			"$fileManager" = "nautilus";
			exec-once = [
				"noctalia"
			];
			bind = [
				"$mod, Q, exec, $termanal"
				"$mod, C, killactive, "
				"$mod, M, exit, "
				"$mod, E, exec, $fileManager"
			];
			bindm = [
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
		};
	};
}
