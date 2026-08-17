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
			theme = "robbyrussell";
		};
	        enableCompletion = true;
     		autosuggestions.enable = true;
          	syntaxHighlighting.enable = true;
     		promptInit = ''
if [[ ! -f ~/.p10k.zsh ]]; then
        echo "⚙️  Создаём стандартную конфигурацию Powerlevel10k..."
        # Создаём файл с стандартной конфигурацией
        cat > ~/.p10k.zsh << 'EOF'
# Стандартная конфигурация Powerlevel10k
# Запустите 'p10k configure' для настройки

# Тип терминала
typeset -g POWERLEVEL9K_TERM=screen-256color

# Цветовая схема
typeset -g POWERLEVEL9K_COLOR_SCHEME=dark

# Отключаем автоматический запуск мастера
typeset -g POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Базовая настройка
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)

# Стили
typeset -g POWERLEVEL9K_MODE=nerdfont-complete
typeset -g POWERLEVEL9K_ICON_PADDING=none
EOF
      fi
      
      # Подключаем Powerlevel10k
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      
      # Загружаем конфигурацию
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      
      # Отключаем сообщение Oh My Zsh о ненайденной теме
      export ZSH_THEME=""'';
#		promptInit = ''
#      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
#    '';
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
