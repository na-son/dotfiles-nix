# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [
    "xhci_pci" "nvme" "usb_storage" "sd_mod"
    "pinctrl_icelake"
    "surface_aggregator" "surface_aggregator_registry" "surface_hid_core" "surface_hid"
    "intel_lpss" "intel_lpss_pci"
    "8250_dw"
    "aesni_intel" "cryptd"
  ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices."cryptroot".device = "/dev/disk/by-uuid/d2c5faa3-4cbf-4d77-8761-0d21f0a63ce3";

  fileSystems."/" =
    { device = "/dev/pool/root";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CE2B-830E";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/pool/swap"; }
    ];

  networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;
}
