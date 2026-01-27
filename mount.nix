{ config, pkgs, lib, ... }:

{
  # Mounting Drives

  # Samsung
  fileSystems."/home/steve/Drives/Samsung" = {
    device = "/dev/disk/by-uuid/6bbf4ff8-d177-478f-8e98-84045e1ab79a";
    fsType = "btrfs";
    options = [
      "users" 
      "nofail"
      "exec" 
      "compress=zstd:15"
      "ssd"
      "noatime"
    ];
   };
 
  # Micron
   fileSystems."/home/steve/Drives/Micron" = {
    device = "/dev/disk/by-uuid/edd8df7d-a553-4793-a2e3-7809cfb36543";
    fsType = "btrfs";
    options = [ 
      "users"
      "nofail"
      "exec"
      "compress=zstd:15"
      "ssd"
      "noatime"
    ];
   };

  # Silver
  fileSystems."/home/steve/Drives/Silver" = {
    device = "/dev/disk/by-uuid/01dfc69f-008c-4b26-8b1d-1dae7b0f1c21";
    fsType = "btrfs";
    options = [ 
      "users" 
      "nofail" 
      "exec" 
      "compress=zstd:15"
      "ssd"
      "noatime"
    ];
   };

  # White
  # fileSystems."/home/steve/Drives/White" = {
  #   device = "/dev/disk/by-uuid/49f0760c-984a-4b62-a4b8-49a770c869bb";
  #   fsType = "ext4";
  #   options = [ 
  #     "users"
  #     "nofail" 
  #     "exec"
  #     "noatime" 
  #   ];
  #  };

  # WD
  fileSystems."/home/steve/Drives/WD" = {
    device = "/dev/disk/by-uuid/25f1a6c5-d176-4ef5-9157-35b95947bd40";
    fsType = "xfs";
    options = [ 
      "users"
      "nofail" 
      "exec"
      "noatime" 
    ];
   };


  # Black 
  fileSystems."/home/steve/Drives/Black" = {
    device = "/dev/disk/by-uuid/e7d8bbdf-59eb-4717-bf0d-4dae39ca9b07";
    fsType = "btrfs";
    options = [ 
      "users"
      "nofail" 
      "exec" 
      "compress=zstd:15" 
      "ssd"
      "noatime"
    ];
   };

  
  # Seagate
  fileSystems."/home/steve/Drives/Seagate" = {
    device = "/dev/disk/by-uuid/bf2a43fc-c77a-4a02-840d-cb5ac9bcc979";
    fsType = "ext4";
    options = [ 
      "users"
      "nofail" 
      "exec" 
      "noatime"
    ];
   };

  # Extreme 
  fileSystems."/home/steve/Drives/Extreme" = {
    device = "/dev/disk/by-uuid/7062363d-4a83-4192-b685-4f306bbe0a83";
    fsType = "btrfs";
    options = [ 
      "users"
      "nofail" 
      "exec" 
      "compress=zstd:15" 
      "ssd"
      "noatime"
    ];
   };



}
