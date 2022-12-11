{ user, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.cpu.intel.updateMicrocode = true;

  networking.interfaces.wlp170s0.useDHCP = true;

  nix.registry.ln.to = { type = "git"; url = "file:///home/${user}/Code/nixpkgs"; };

  services.tailscale.useRoutingFeatures = "client";

  services.fprintd.enable = true;

  services.xserver.displayManager.defaultSession = lib.mkForce "sway";

  # Check that this can be bumped before changing it
  system.stateVersion = "22.05";
}
