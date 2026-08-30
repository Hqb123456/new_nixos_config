{ config, lib, pkgs, ... }:
{
	# 系统级启用 zsh（提供 /etc/zshenv、全局补全等，不管理 ~/.zshrc）
	programs.zsh.enable = true;

	users.users.shorin = {
		isNormalUser = true;
		extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
			shell = pkgs.zsh;
			packages = with pkgs; [
			];
	};
}
