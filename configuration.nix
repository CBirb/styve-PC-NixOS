# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./virt.nix
      ./game.nix
      ./audio.nix
      ./mount.nix
      # ./themes.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
														
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  
  # boot.kernelModules = [
  #   "ip_tables"
  #   "iptable_filter"
  #   "iptable_nat"
  #   "iptable_mangle"
  #   "nf_nat"
  #   "nf_conntrack"
  #   "binder_linux"
  #   "ashmem_linux"
  #   "tun"
  #   "veth"
  #   "br_netfilter"
  # ];

  # boot.initrd.kernelModules = [ 
  #   "vfio_pci"
  #   "vfio_iommu_type1"
  #   # "i915" # replace or remove with your device's driver as needed
  #   "amdgpu"
  # ];

  # boot.kernelParams = [
  #   "amd_iommu=on"
  #   "iommu=pt"
  #   "vfio-pci.ids=1002:7550,1002:ab40"
  # ];

   

  # Kernel
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelPackages = pkgs.linuxPackages;
  # boot.kernelPackages = pkgs.linuxPackages-rt;
  boot.kernelPackages = pkgs.linuxPackages_zen;



  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Vienna";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_AT.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_AT.UTF-8";
    LC_IDENTIFICATION = "de_AT.UTF-8";
    LC_MEASUREMENT = "de_AT.UTF-8";
    LC_MONETARY = "de_AT.UTF-8";
    LC_NAME = "de_AT.UTF-8";
    LC_NUMERIC = "de_AT.UTF-8";
    LC_PAPER = "de_AT.UTF-8";
    LC_TELEPHONE = "de_AT.UTF-8";
    LC_TIME = "de_AT.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
   services.xserver = {
     enable = true;
     desktopManager = {
       xterm.enable = false;
       xfce.enable = true;
     };
   };

  # Cinnamon
  programs.gnupg.agent.pinentryPackage = lib.mkForce pkgs.pinentry-qt;
  

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
 

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    #   lxqt.xdg-desktop-portal-lxqt
    ];
  };
  
  
  fonts.packages = with pkgs;
    (builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts)) ++ [
      # Add any extra fonts here, e.g. dejavu_fonts, noto-fonts, etc.
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-color-emoji
        noto-fonts-cjk-serif
        julia-mono
        liberation_ttf
        dejavu_fonts
        fira-code
        fira-code-symbols
        mplus-outline-fonts.githubRelease
        dina-font
        proggyfonts
        bront_fonts
        ucs-fonts
        nerd-fonts.droid-sans-mono
        nerd-fonts.fira-code 
    ];

  fonts.fontconfig.enable = true;

 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "at";
    variant = "";
  };

  # Scrub
  services.btrfs.autoScrub.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };
  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    "context.properties" = {
      "default.clock.rate" = 48000;        # Samplerate
      "default.clock.quantum" = 1024;       # Buffersize
      "default.clock.min-quantum" = 512;
      "default.clock.max-quantum" = 2048;
    };
  };

  # Razer
  hardware.openrazer.enable = true;
  


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.steve = {
    isNormalUser = true;
    description = "steve";
    extraGroups = [ "networkmanager" "wheel" "podman" "kvm" "libvirtd" "audio" "video" "input" "disk" "libvirt" "render" "realtime" "openrazer" "gamemode" "docker" ];
    packages = with pkgs; [
    ];
  };

  # Z-Ram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  # This refers to the uncompressed size, actual memory usage will be lower.
    memoryPercent = 37;
  };
 
  # boot.kernelParams = [
  #   "zswap.enabled=1" # enables zswap
  #   "zswap.compressor=zstd" # compression algorithm
  #   "zswap.max_pool_percent=29" # maximum percentage of RAM that zswap is allowed to use
  #   "zswap.shrinker_enabled=1" # whether to shrink the pool proactively on high memory pressure
  # ];

  # Swappines
  boot.kernel.sysctl = {
    "vm.swappiness" = lib.mkForce 5;
  };

  # Udisk
  services.udisks2.enable = true;

  # ClamAv
  services.clamav.daemon.enable = true;
  services.clamav.updater.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Fstrim
  services.fstrim.enable = true;
  services.fstrim.interval = "weekly";

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Insecure Packages
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-qt5-1.1.05"
    "qtwebengine-5.15.19"
  ];

  

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    
    ## Basic Tools
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    parted 
    gparted
    stable.insync
    bash
    kdePackages.ffmpegthumbs
    ocamlPackages.ffmpeg
    ffmpeg
    ffmpeg-full
    ffmpeg-normalize
    zenity
    gnome-disk-utility
    clamav
    clamtk
    qemu
    gitFull
    unzip
    unrar
    stable.megasync
    mission-center
    bat
    ptyxis
    freetype
    clinfo 
    unixtools.fdisk
    util-linux
    unixtools.util-linux
    libuuid
    unixtools.fsck
    toybox
    pciutils
    dmidecode    
    samba
    kdePackages.kdenetwork-filesharing
    

    # Other Tools
    stable.woeusb
    smartmontools
    nagiosPlugins.check_smartmon
    gsmartcontrol
    xfsprogs
    libxfs    

    # Container
    distrobox
    podman-compose
    docker-compose
    kubernix
    kubernetes
    kubergrunt
    gearlever

    # Virt-Manager
    dnsmasq 

    # Appimage
    # fetchurl
    appimage-run
    libappimage
    freerdp      

    # Razer
    openrazer-daemon
    polychromatic    
    

    # Pkg
    pkg  
    pkgsite
    pkgdiff
    pkgconf
    pkg-config
 
    ## Sys-Monitoring
    htop
    btop
    fastfetch

    ## BTRFS  Tools
    btrfs-progs
    btrfs-assistant
    btrfs-list
    btrfs-heatmap

    # Uni-Tools
    texliveTeTeX
    texliveFull
    miktex
    texliveGUST
    texliveBookPub
    texstudio

    
    # GIT
    stable.github-runner
    stable.github-desktop
    stable.github-backup
    stable.github-release

    # Coding Tools
    valgrind
    python314
    python313
    python311
    python310
    libgcc
    zulu
    rustc
    rustup
    go
    rocmPackages.clang

    ## AMD
    mesa.opencl
    mesa
    mesa-demos
    driversi686Linux.mesa
    mesa-gl-headers
    driversi686Linux.mesa-demos
    opencl-headers
    libva
    libva-utils
    vulkan-tools
    vulkan-loader
    vulkan-headers
    vulkan-utility-libraries
    # amdvlk
    # driversi686Linux.amdvlk
    amdgpu_top
    amdenc
    amdctl
    amd-ucodegen
    amd-libflame
    nvtopPackages.amd
    rocmPackages.amdsmi
    lact 
    zluda
    rocmPackages.rocminfo
    # rocmPackages.clr    
     

    ## Desktop Tools  
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.konsole
    kdePackages.yakuake
    kdePackages.qmlkonsole
    kdePackages.partitionmanager
    kdePackages.kpmcore
    gvfs
    gnome-terminal     
    
  
    # Hyprland Tools
    udisks
    udiskie


    ## Gaming
    
    # Main Games
    xorg.xhost
    game-devices-udev-rules
    mangohud
    gamescope
    gamemode
    picom

    # extra Games
    bastet
    ninvaders
    # pacman-game
    nsnake
    greed
    bsdgames
    nethack
    moon-buggy
    crawl
    egoboo
    sil-q
    cataclysm-dda
    brogue-ce
    angband
    narsil
    # tome2
    ace-of-penguins
    yquake2-all-games


    ## Video
    unstable.blackmagic
    unstable.davinci-resolve
     
    # AMD Tools    

    # Non-Audio Wine
    wineWowPackages.waylandFull
    winetricks

    ## Audio-Production

    # inputs.native-access-nix.packages.x86_64-linux.native-access

    # Audio-Wine
    wineasio
    wineWowPackages.fonts
  ];

  # environment.variables = {
  #   RUSTICL_ENABLE = "radeonsi";
  # };
  
  # Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };
  nix.settings.auto-optimise-store = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    firewall.enable = true;
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
