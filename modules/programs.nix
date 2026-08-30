{ config, lib, pkgs, ... }:

{
	programs.firefox.enable = true;

	programs.pay-respects = {
		enable = true;
		alias = "fcm";
	};

	programs.nix-ld = {
		enable = true;
	};

	programs.appimage = {
		enable = true;
		binfmt = true;
	};

	nixpkgs.config = {
		allowUnfree = true;
	};

	programs.niri = {
		enable = true;
	};

	programs.nh = {
		enable = true;
	};

	programs.zsh = {
		enable = true;
	};
}
