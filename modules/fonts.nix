{ config, lib, pkgs, ... }:

{
	fonts.fontDir.enable = true;
	fonts.packages = with pkgs; [
		wqy_zenhei
		noto-fonts-cjk-sans
		noto-fonts-color-emoji
		nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
		iosevka
	];
}
