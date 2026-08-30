{ config, lib, pkgs, ... }:

{
	services.printing.enable = true;

	services.pipewire = {
		enable = true;
		pulse.enable = true;
	};

	services.libinput.enable = true;

	services.openssh.enable = true;

	services.flatpak.enable = true;

	services.emacs = {
		enable = true;
		package = pkgs.emacs-gtk;
	};
	services.displayManager.defaultSession = "niri";
}
