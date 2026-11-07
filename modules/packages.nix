{ config, lib, pkgs, kwin-effects-better-blur-dx, ... }:

{
	environment.systemPackages = with pkgs; [
		winboat
      nvd
			gpu-screen-recorder
			brightnessctl
			playerctl
			chromium
			vim
			wget
			curl
			git
			ghostscript  # DocView 默认使用 Ghostscript 进行转换
			cmake
			libtool
			gnumake
			cmake
			ninja
			gcc
			clang-tools
			clang
			nil
			lua-language-server
			bash-language-server
			gdb
			lldb
			xwayland-satellite
			kdePackages.qtstyleplugin-kvantum
			kwin-effects-better-blur-dx.packages.${pkgs.stdenv.hostPlatform.system}.default
			bibata-cursors
			xclip
			xdotool
			xprop
			xwininfo
			virt-viewer
			];
}
