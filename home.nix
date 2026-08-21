{ config, pkgs, lib, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "yoel";
  home.homeDirectory = "/home/yoel";

  home.pointerCursor = {
    name = "Adwaita";
    package = pkgs.adwaita-icon-theme;
    size = 24;
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "26.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yoel/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

	wayland.windowManager.hyprland = {
		enable = true;
		systemd.enable = true;
		#configType = "lua";
		extraConfig = ''
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR", "24")
hl.monitor({
	output = "Virtual-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1,
})
hl.on("hyprland.start", function() hl.exec_cmd("noctalia") end)
hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd("nautilus"))
hl.bind("SUPER + F", hl.dsp.exec_cmd("firefox"))
hl.bind("SUPER + T", hl.dsp.exec_cmd("Telegram"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("noctalia msg panel-toggle launcher"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("noctalia msg session lock"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("noctalia msg wallpaper-random"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("noctalia msg settings-toggle"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("noctalia msg panel-toggle clipboard"))
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.config({
general = {
	gaps_in = 5,
	gaps_out = 20,
	border_size = 3,
	resize_on_border = false,
	allow_tearing = false,
	layout = "dwindle",
},
decoration = {
	rounding = 10,
	active_opacity = 0.97,
	inactive_opacity = 0.8,
},
input = {
	kb_layout = "us,ru",
	kb_options = "grp:win_space_toggle",
},
})
'';
	};
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      font_family = "JetBrains Mono";
      font_size = "12.0";
      window_padding_width = 10;
    };
    themeFile = "Kaolin_Temple";
  };
  programs.firefox = {
    enable = true;
    languagePacks = [ "ru-RU" "en-US" ];
    #preferences = {
    #  "browser.startup.homepage" = "https://dzen.ru";
    #};
    policies = {
      DisableTelemetry = true;
    };
    profiles.default = {
        id = 0;
        name = "Default";
        isDefault = true;
        settings = {
            "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            "browser.startup.homepage" = "https://dzen.ru";
        };
    };
  };

  programs.git = {
      enable = true;
      userName = "Liza Belonina";
      userEmail = "fkme.fuhua@gmail.com";
  };
  gtk = {
    enable = true;
    theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
    };
    gtk3.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme=1
        '';
    };

    gtk4.extraConfig = {
        Settings = ''
            gtk-application-prefer-dark-theme=1
        '';
    };
    # qt = {
    #     enable = true;
    #     platformTheme = "gnome";
    #     style = {
    #         name = "adwaita-dark";
    #         package = pkgs.adwaita-qt;
    #     };
    # };
  };
}
