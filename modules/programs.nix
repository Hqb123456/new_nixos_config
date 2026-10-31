{ config, lib, pkgs, ... }:

{
	programs.clash-verge = {
		enable = true;
		serviceMode = true;
		tunMode = true;
		autoStart = true; # 可选：开机自启
	};

	programs.gpu-screen-recorder.enable = true;
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

	programs.hyprland = {
		enable = true;
	};

	programs.nh = {
		enable = true;
	};

	programs.zsh = {
		enable = true;
	};
}
