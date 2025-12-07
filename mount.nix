{ config, pkgs, lib, ... }:

{
  # Mounting Drives

  # Samsung
  fileSystems."/home/steve/Drives/Samsung" = {
    device = "/dev/disk/by-uuid/a9e5d713-cf93-4a1e-b79f-8734b328f9bf";
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
    device = "/dev/disk/by-uuid/497bbb3a-cbbd-4e92-b11e-74c2261b099c";
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
    device = "/dev/disk/by-uuid/16491837-7651-47b7-9efc-6f68d2d68dc5";
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

  # WD
  # fileSystems."/home/steve/Drives/WD" = {
  #   device = "/dev/disk/by-uuid/bd72a17f-64d9-4c42-b517-29602d4f95bf";
  #   fsType = "ext4";
  #   options = [ 
  #     "users"
  #     "nofail" 
  #     "exec"
  #     "noatime" 
  #   ];
  #  };

  # Black 
  fileSystems."/home/steve/Drives/Black" = {
    device = "/dev/disk/by-uuid/1adbf3b4-173c-40d2-b9e8-57550fd9331f";
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



}
