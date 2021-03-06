{ pkgs, lib, inputs, username, ... }:

{
  imports = [
    ./alacritty.nix
    ./gnome.nix
    ./git.nix
    ./neovim.nix
    ./powerline.nix
    ./rofi.nix
    ./tmux.nix
    ./vscode.nix
    ./zsh.nix
  ];

  home = {
    inherit username;
    stateVersion = "21.05";
    sessionVariables = {
      EDITOR = "nvim";
      NIC_CC = "${pkgs.gcc.out}";
    };
    packages = with pkgs; [
      qemu
      screenkey
      slop
      peek
      gnome.gnome-sound-recorder
      undervolt
      # nonfree packages
      # steam
      parsec
      google-chrome
      _1password
      _1password-gui
      discord
      reaper
    ];
    file = {
      ".config/nixpkgs/config.nix".text = ''
        {
          allowUnfree = true;
        }
      '';
    };
  };

  programs.home-manager.enable = true;
}
