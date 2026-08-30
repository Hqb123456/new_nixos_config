{ config, lib, pkgs, kwin-effects-better-blur-dx, ... }:

{
	environment.systemPackages = with pkgs; [
		chromium
		vim
		neovim
		neovide
		wget
		curl
		git
    cmake
    libtool
    gnumake
    gcc
		clang-tools
		clang
		nil
		lua-language-server
    gdb
		lldb
		xwayland-satellite
		kdePackages.qtstyleplugin-kvantum
		kwin-effects-better-blur-dx.packages.${pkgs.system}.default
		bibata-cursors
	];
}
