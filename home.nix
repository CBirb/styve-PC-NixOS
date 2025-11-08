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
  
  programs.git.settings = {
    enable = true;
    userName  = "CBirb";
    userEmail = "stephan.heinz@gmx.at";
  };


  ## Force Section Start

  # xdg.configFile."gtk-4.0/gtk.css".force = true;
  # xdg.configFile."gtk-4.0/settings.ini".force = true;
  # xdg.configFile."gtk-3.0/settings.ini".force = true;
  # xdg.dataFile."icons/default/index.theme".force = true;
  # home.file.".gtkrc-2.0".force = true;
  # home.file.".icons/default/index.theme".force = true;
  
  ## Force Section End

 
  home.sessionVariables = {
    XDG_DATA_DIRS = "/usr/share:/usr/local/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    FONTCONFIG_PATH = "/etc/fonts";
  };  

  wayland.windowManager.hyprland = {
    systemd.variables = ["--all"];
    settings = {
      "$mod" = "SUPER";
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, B, exec, flatpak run com.brave.Browser"
          ", Print, exec, grimblast copy area"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
 
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   # x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 16;
  # };

  # gtk = {
  #   enable = true;

  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };

  #   iconTheme = {
  #     package = pkgs.adwaita-icon-theme;
  #     name = "Adwaita";
  #   };

  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };


  home.stateVersion = "24.11";
}
