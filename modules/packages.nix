{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   curl
   git
   kitty
   firefox
   telegram-desktop
   zsh-powerlevel10k
   curl
   amnezia-vpn
   steam
   # discord-ptb
   lsd
   bat
   amberol
   btop
   fastfetch
   obsidian
   nautilus
   gimp
   qbittorrent
   tree
   uv
   hyprshot
   # grim
   # slurp
   # wl-clipboard
   # libnotify
  ];
  users.defaultUserShell = pkgs.zsh;
}
