{ config, pkgs, ... }:

{

  # ----------------------------
  # Basic user settings
  # ----------------------------
  home.username = "steve";
  home.homeDirectory = "/home/steve";

  # ----------------------------
  # Enable Home Manager programs
  # ----------------------------
 
  # wayland.windowManager.hyprland.enable = true;  
 
  programs = {
    home-manager.enable = true;
    kitty.enable = true;
  };
  
  programs.git = {
    enable = true;
    userName  = "CBirb";
    userEmail = "stephan.heinz@gmx.at";
  };

  services.picom = {
    enable = true;
  };
  ## Force Section Start

  ## Force Section End

 
  home.sessionVariables = {
    XDG_DATA_DIRS = "/usr/share:/usr/local/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    FONTCONFIG_PATH = "/etc/fonts";
  };  

  

  home.stateVersion = "24.11";
}
