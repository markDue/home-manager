{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "marc";
  home.homeDirectory = "/home/marc";

  # Enable this on non nixos
  targets.genericLinux.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  #imports = [ ./packages ];
  home.packages = with pkgs; [

  # # You can also create simple shell scripts directly inside your
  # # configuration. For example, this adds a command 'my-hello' to your
  # # environment:

  # fonts______________________/
   (pkgs.writeShellScriptBin "my-hello" '' echo "Hello, ${config.home.username}!" '')
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    (pkgs.nerdfonts.override { fonts = [ "ComicShannsMono" ]; })
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; })
    (pkgs.nerdfonts.override { fonts = [ "CascadiaMono" ]; })
    (pkgs.nerdfonts.override { fonts = [ "Ubuntu" ]; })
    (pkgs.nerdfonts.override { fonts = [ "CodeNewRoman" ]; })
    #(pkgs.nerdfonts.override { fonts = [ "MaterialDesign" ]; })
    #material-symbols font-awesome #nerdfonts

  # text editors______________________/
    vscodium helix neovim vim
    #pkgs.bluefish #pkgs.vscodium #pkgs.texmaker #pkgs.kate #pkgs.emacs 
    #pkgs.cudatext

  # related window managers______________________/
     hyprland sway
     river i3blocks
      dk tofi yazi lf ranger spectrwm picom dunst wofi mako
    #pkgs.qtile pkgs.awesome pkgs.openbox pkgs.sway pkgs.river pkgs.waybar 
    #pkgs.tint2 pkgs.rofi

  # desktop environments______________________/
    #budgie.budgie-desktop

  # shell & CLI______________________/
    #vimPlugins.Vundle-vim wifite2 wev
    wirelesstools linssid reaverwps-t6x wireshark kismet aircrack-ng
    glow fortune hollywood zsh neofetch bat cmatrix tmux trashy curl git wget htop fzf hugo
    yt-dlp simple-mtpfs go-mtpfs rsync nodejs gem gemstash ruby jekyll 
    antidote tty-clock
    #pkgs.cava 

  # apps______________________/
    #zeroadPackages.zeroad-unwrapped zeroadPackages.zeroad-data
    librewolf chromium
    notesnook anki ticktick zed-editor networkmanagerapplet mailspring evolution whatsapp-for-linux super-productivity obsidian 
    #thunderbird #joplin-desktop 
    wl-color-picker tauon arc-kde-theme arc-icon-theme epapirus-icon-theme variety blender 
    #font-manager krita kate scribus tty-clock inkscape 
    gimp kdenlive 
	  #prismlauncher flameshot  variety persepolis zathura 
    syncthing #scrcpy 
	  #alacritty foot chromium librewolf museeks strawberry 
	  #clementine pantheon.elementary-icon-theme fontpreview 

  ];

  home.file = {
    #".config/river".source = ~/Desktop/river;
  };

  #gtk.enable = true;
  #gtk.cursorTheme.package = pkgs.bibata-cursors;
  #gtk.cursorTheme.name = "Bibata-Modern-Ice";

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/marc/etc/profile.d/hm-session-vars.sh
  
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
     EDITOR = "nvim";
  };


   #wayland.windowManager.sway.enable = true;  

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
