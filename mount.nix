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
  #   device = "/dev/disk/by-uuid/cabba7b9-5334-41b7-aad0-c4c6effba1fd";
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
    device = "/dev/disk/by-uuid/7530d0b2-918c-42f0-be22-599ed87a46b8";
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
    device = "/dev/disk/by-uuid/4a792895-dbfd-4f40-984f-07693652500d";
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
