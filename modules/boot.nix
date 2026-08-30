{ config, lib, pkgs, ... }:

{
	boot.plymouth.enable = true;
	boot.loader = {
		grub = { 
			enable = true;
			efiSupport = true;
			device = "nodev";
			useOSProber = true;
		};
		efi = {
			canTouchEfiVariables = true;
		};
	};

# ========== 内核配置 ==========
	boot.kernelPackages = pkgs.linuxPackages_latest;  
}
