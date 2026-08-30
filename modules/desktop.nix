{ config, lib, pkgs, ... }:

{
	time.timeZone = "Asia/Shanghai";

	services = {
		displayManager = {
			ly.enable = true;
		};
		desktopManager.plasma6.enable = true;
		xserver = {
			enable = true;
			desktopManager = {
				xfce.enable = true;
				runXdgAutostartIfNone = true;
			};
			xkb = {
				layout = "us";
				options = "eurosign:e,caps:escape";
			};
		};
	};
}
