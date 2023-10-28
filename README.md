# Inspiration

- `flake.nix` grew from https://github.com/colemickens/nixos-flake-example/blob/master/flake.nix
- `overlays/paperwm/flake.nix` is based off https://github.com/nix-community/neovim-nightly-overlay/blob/master/flake.nix

## Setup

### NixOS

Add to `/etc/nixos/configuration.nix`:

```nix
{
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  nix.binaryCaches = [ "https://enzime.cachix.org" ];
  nix.binaryCachePublicKeys = [
    "enzime.cachix.org-1:RvUdpEy6SEXlqvKYOVHpn5lNsJRsAZs6vVK1MFqJ9k4="
  ];
}
```

### Non-NixOS

Add to `~/.config/nix/nix.conf`:

```nix
experimental-features = nix-command flakes
substituters = https://enzime.cachix.org https://cache.nixos.org/
trusted-public-keys = enzime.cachix.org-1:RvUdpEy6SEXlqvKYOVHpn5lNsJRsAZs6vVK1MFqJ9k4= cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=
```

## Usage

linux

```shell
nixos-rebuild build-vm --flake github:na-son/dotfiles-nix#phi-nixos
```

```shell
home-manager switch --flake github:na-son/dotfiles-nix#enzime@phi-nixos
```

macos

```shell
nix run nix-darwin -- switch --flake github:na-son/dotfiles-nix#.darwinConfigurations.chi.system
```

## Cachix w/o adding to config

If you did not add Cachix to your Nix config, you can use the following flags on any Nix commands:

```shell
--option substituters "https://enzime.cachix.org https://cache.nixos.org" --option trusted-public-keys "enzime.cachix.org-1:RvUdpEy6SEXlqvKYOVHpn5lNsJRsAZs6vVK1MFqJ9k4 cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
```
