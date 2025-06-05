# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader={
	efi = {
	canTouchEfiVariables = true;
	efiSysMountPoint = "/boot/efi";	
};
grub = {

	efiSupport= true;
	device = "nodev";
};


};





  networking.hostName = "arc"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kathmandu";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.incessant = {
    isNormalUser = true;
    description = "incessant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
neovim
wget
kitty
hyprland
kdePackages.sddm
hyprlock
hyprlang
pavucontrol
brave
gvfs
udisks2
fuse2
git
xfce.thunar
xfce.thunar-volman
fish
ntp 
waybar
swww
brightnessctl
playerctl
vscode
pyprland
unzip
grim
slurp
wl-clipboard
];
  nixpkgs.config.allowUnfree = true;
#  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
#HYPRLAND
programs.hyprland = {
	enable = true;
	xwayland.enable = true;
};
programs.dconf.profiles.user.databases = [
  {
    settings."org/gnome/desktop/interface" = {
      gtk-theme = "Adwaita";
      icon-theme = "Flat-Remix-Red-Dark";
      font-name = "Noto Sans Medium 11";
      document-font-name = "Noto Sans Medium 11";
      monospace-font-name = "Noto Sans Mono Medium 11";
    };
  }
];

xdg.portal.enable = true;
xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-hyprland];
security.polkit.enable = true;
#PIPEWIRE
security.rtkit.enable = true;
services.pipewire = {
	enable = true;
	alsa.enable = true;
	pulse.enable = true;
	jack.enable = true;
};

#SDDM
services.displayManager.sddm = {
	enable = true;
	wayland.enable = true;

};

#FONTS
fonts.fontDir.enable = true; #For flatpak
fonts.packages = with pkgs; [

	nerd-fonts.fira-code
	nerd-fonts.noto
	nerd-fonts.symbols-only
	noto-fonts-cjk-sans
	noto-fonts-emoji
	nerd-fonts.jetbrains-mono
];
#Flatpak
services.flatpak.enable = true;
#For Volumes
services.gvfs.enable = true;
services.udisks2.enable = true;
}
