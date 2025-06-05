{ config, pkgs, spicetify-nix, ... }:

{
  home.username = "incessant";
  home.homeDirectory = "/home/incessant";

  home.packages = with pkgs; [
    btop
    fastfetch
    feh
    rofi
    vesktop
  ];

  # Import Spicetify-nix module
  imports = [
    spicetify-nix.homeManagerModules.spicetify
  ];

  # Configure Spicetify
  programs.spicetify = let
	 spicePkgs = spicetify-nix.legacyPackages.${pkgs.stdenv.system};
  in{
    enable = true;
    enabledCustomApps = with spicePkgs.apps; [
       lyricsPlus
       marketplace
    ];
    enabledExtensions = with spicePkgs.extensions; [
	adblockify
    ];
  theme = spicePkgs.themes.sleek;
  colorScheme = "RosePine";
};
 
gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };


 home.stateVersion = "25.05";  
}
