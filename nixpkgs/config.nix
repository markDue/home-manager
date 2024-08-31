{ pkgs, ... }:

{
# main configuration file for nix packages

allowUnfree = true;
#nix.extraOptions = " experimental-features = nix-command flakes ";
#nix.extraOptions.experimental-features = [ "nix-command" "flakes" ];

security.polkit.enable = true;
#services.xserver.enable = true;
hardware.opengl = {
  enable  = true;
  #package = (pkgs.mesa.override { galliumDrivers = [ "i915" ]; }).drivers;
  #driSupport = true;
  #driSupport32Bit = true;
};

hyperland.enable = true;

programs.sway.enable = false;
wayland.windowManager.sway = { enable = false; systemd.enable = true; };
programs.sway.xwayland.enable = true;
programs.sway.wrapperFeatures.gtk = true;
programs.sway.extraPackages = with pkgs; [ xwayland autotiling swaybg sway-wallpapers sway-systemd sway-config-upstream swaylock swayidle foot tofi ];
programs.sway.extraOptions = [" --config /home/marc/.config/sway/config "];

#i18n.extraLocaleSupported = {
#  LC_MESSAGES = "en_US.UTF-8";
#  LC_TIME = "en_US.UTF-8";
#  LC_ALL = "en_US.UTF-8";
#  LANGUAGE = "en_US.UTF-8";
#};

i18n.defaultLocale = "en_US.UTF-8";
time.timeZone = "Africa/Ciaro";
#i18n.extraLocaleSettings = {
#LC_TIME = "de_CH.UTF-8";
#};

}
