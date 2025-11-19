{ config, pkgs, lib, ... }:

{
  # Mounting Drives

  # Samsung
  fileSystems."/home/steve/Drives/Samsung" = {
    device = "/dev/disk/by-uuid/eb7e94b1-d131-46a8-b521-5e5463c65d3c";
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
    device = "/dev/disk/by-uuid/1754e144-0e69-4af7-9cbb-926bb61c1642";
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
    device = "/dev/disk/by-uuid/d40229cb-235d-4cdc-9331-9593d73cc787";
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
    device = "/dev/disk/by-uuid/c9428bbc-2121-424c-8cf9-4bbb53734675";
    fsType = "ext4";
    options = [ 
      "users"
      "nofail" 
      "exec" 
    ];
   };

  # Black 
  fileSystems."/home/steve/Drives/Black" = {
    device = "/dev/disk/by-uuid/c8d2a329-4417-4d88-b49c-127b17950f28";
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
