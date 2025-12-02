{ config, pkgs, lib, ... }:

{
  # Mounting Drives

  # Samsung
  fileSystems."/home/steve/Drives/Samsung" = {
    device = "/dev/disk/by-uuid/612253af-1829-45cc-a29b-ffa401220ff0";
    fsType = "btrfs";
    options = [
      "users" 
      "nofail"
      "exec" 
      "compress=zstd:15"
      "ssd"
    ];
   };
 
  # Micron
   fileSystems."/home/steve/Drives/Micron" = {
    device = "/dev/disk/by-uuid/9ffc1234-c3fc-4d0c-a888-5f9dada18be9";
    fsType = "btrfs";
    options = [ 
      "users"
      "nofail"
      "exec"
      "compress=zstd:15"
      "ssd"
    ];
   };

  # Silver
  fileSystems."/home/steve/Drives/Silver" = {
    device = "/dev/disk/by-uuid/7015cd96-ba5b-4281-a87f-a2fc0e1bb34f";
    fsType = "btrfs";
    options = [ 
      "users" 
      "nofail" 
      "exec" 
      "compress=zstd:15"
      "ssd"
    ];
   };

  # WD
  fileSystems."/home/steve/Drives/WD" = {
    device = "/dev/disk/by-uuid/bd72a17f-64d9-4c42-b517-29602d4f95bf";
    fsType = "ext4";
    options = [ 
      "users"
      "nofail" 
      "exec" 
    ];
   };

  # Black 
  fileSystems."/home/steve/Drives/Black" = {
    device = "/dev/disk/by-uuid/7423c71c-7d74-434a-93ef-6ca42c18f3de";
    fsType = "btrfs";
    options = [ 
      "users"
      "nofail" 
      "exec" 
      "compress=zstd:15" 
      "ssd"
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
    ];
   };



}
