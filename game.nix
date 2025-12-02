{ config, pkgs, lib, ... }:

{
  
  
  # AMD-GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.opencl.enable = true;

  systemd.services.lact = {
    description = "AMDGPU Control Daemon";
    after = ["multi-user.target"];
    wantedBy = ["multi-user.target"];
    serviceConfig = {
      ExecStart = "${pkgs.lact}/bin/lact daemon";
    };
    enable = true;
  };

   # Steam
   programs = {
     gamescope = {
       enable = true;
       capSysNice = true;
     };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };
  # hardware.xone.enable = true; # support for the xbox controller USB dongle
  services.getty.autologinUser = "steve";
  environment = {
    systemPackages = [ pkgs.mangohud ];
    loginShellInit = ''
      [[ "$(tty)" = "/dev/tty1" ]] && ./gs.sh
    '';
  };

  # Gamemode
  programs.gamemode.enable = true;


}
