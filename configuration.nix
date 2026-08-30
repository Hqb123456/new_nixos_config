{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
		./modules/boot.nix
		./modules/hardware.nix
		./modules/nix.nix
		./modules/users.nix
		./modules/networking.nix
		./modules/locale.nix
		./modules/desktop.nix
		./modules/services.nix
		./modules/programs.nix
		./modules/packages.nix
		./modules/fonts.nix
		./modules/noctalia.nix
		./modules/test.nix
		./modules/virtualisation.nix
];

	system.stateVersion = "26.05";
}
