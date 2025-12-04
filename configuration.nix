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

  boot.kernelModules = [
    "ip_tables"
    "iptable_filter"
    "iptable_nat"
    "iptable_mangle"
    "nf_nat"
    "nf_conntrack"
    "binder_linux"
    "ashmem_linux"
    "tun"
    "veth"
    "br_netfilter"
  ];

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
  # services.xserver.enable = true;

  # Enable the Cinnamon Desktop Environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.cinnamon.enable = true;


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
      lxqt.xdg-desktop-portal-lxqt
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
      "default.clock.quantum" = 128;       # Buffersize
      "default.clock.min-quantum" = 64;
      "default.clock.max-quantum" = 256;
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
    extraGroups = [ "networkmanager" "wheel" "podman" "kvm" "libvirtd" "audio" "video" "input" "disk" "libvirt" "render" "realtime" "openrazer" "gamemode" ];
    packages = with pkgs; [
    ];
  };

  # Z-Ram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
  # This refers to the uncompressed size, actual memory usage will be lower.
    memoryPercent = 30;
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
    insync
    bash
    ffmpeg-full
    ffmpeg-normalize
    zenity
    gnome-disk-utility
    clamav
    clamtk
    qemu
    git
    unzip
    unrar
    megasync
    mission-center
    bat
    ptyxis
    freetype
    
    # Container
    distrobox
    podman-compose
    kubernix
    kubernetes
    kubergrunt

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
    github-runner
    github-desktop

    ## Coding
    vscodium     

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
    nexusmods-app-unfree
    nexusmods-app
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
    
    ## Audio-Production

    # Audio-Wine
    yabridge
    yabridgectl
    wineWowPackages.yabridge
    winetricks
    wineasio
    wineWowPackages.fonts


    # Daws
    reaper
    reaper-sws-extension
    reaper-reapack-extension
    ardour
    lmms


    # Clap-Vst
    clap
    rPackages.clap
    chow-tape-model
    lsp-plugins
    
    # LV2-Vst
    lv2
    lv2bm
    lv2lint
    lv2-cpp-tools
    mod-arpeggiator-lv2
    rkrlv2
    bolliedelayxt-lv2
    airwindows-lv2
    magnetophonDSP.CharacterCompressor
    python313Packages.sphinx-lv2-theme
    python312Packages.sphinx-lv2-theme
    aether-lv2
    swh_lv2
    neural-amp-modeler-lv2
    mda_lv2
    x42-plugins
    tunefish
    ttl2c
    sfizz
    plugin-torture
    open-music-kontrollers.vm
    open-music-kontrollers.synthpod
    open-music-kontrollers.moony
    open-music-kontrollers.midi_matrix
    noise-repellent
    mod-distortion
    magnetophonDSP.pluginUtils
    infamousPlugins
    drumgizmo
    distrho-ports
    bshapr
    bchoppr
    gxplugins-lv2
    talentedhack
    sratom
    plujain-ramp
    open-music-kontrollers.orbit
    open-music-kontrollers.mephisto
    mooSpace
    magnetophonDSP.RhythmDelay
    magnetophonDSP.MBdistortion
    lilv
    fverb
    jalv
    jalv-qt
    # fmsynth
    boops
    artyFX
    metersLv2
    bs2b-lv2
    oldoldstable.ams-lv2
    speech-denoiser
    open-music-kontrollers.sherlock
    open-music-kontrollers.router
    ninjas2
    magnetophonDSP.LazyLimiter
    lvtk
    kapitonov-plugins-pack
    eq10q
    bsequencer
    zam-plugins
    x42-gmsynth
    suil
    sorcer
    open-music-kontrollers.jit
    open-music-kontrollers.eteroj
    bschaffl
    x42-avldrums
    surge-XT
    surge
    molot-lite
    ingen
    fomp
    faustPhysicalModeling
    bslizr
    bjumblr
    midi-trigger
    magnetophonDSP.CompBus
    # magnetophonDSP.ConstantDetuneChorus
    vocproc
    juce
    stable.triforce-lv2
    librearp-lv2
    oldstable.gxmatcheq-lv2
    faust2lv2
    bankstown-lv2
    

    # Vst
    vst2-sdk
    airwindows
    oxefmsynth
    bespokesynth-with-vst2
    ninjas2
    bespokesynth
    
    # Other Vst 
    paulstretch
    vital
    drumgizmo
    guitarix
    odin2
    stable.synth
    synthv1
    # oldoldstable.haskellPackages.YampaSynth
    xsynth_dssi
    opnplug
    adlplug
    sonivox
    # stable.qes
    oldoldstable.fmsynth
    magnetophonDSP.VoiceOfFaust
    # haskellPackages.ecta-plugin
    oldstable.decent-sampler

  ];

  
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
