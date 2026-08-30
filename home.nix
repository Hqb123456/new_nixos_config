{config, pkgs, ... }:

{
	home.stateVersion = "26.05";
	home.username = "shorin";
	home.homeDirectory = "/home/shorin";

# 安装软件包
	home.packages = with pkgs; [
		ctags
		lazygit
		tree
		btop
		yazi
		opencode
		fzf                    # 安装 fzf 本身
		bat
		fd                     # 添加 fd，用于文件搜索
		ripgrep
		kitty
		awww
		imagemagick
		fastfetch
		nodejs
		papers
		wmctrl       # 用于窗口管理
		xdotool      # 用于窗口操作
		qt6.qtwayland
		zsh-vi-mode             # zsh 插件：vi 模式
		zsh-powerlevel10k       # zsh 主题
		zsh-syntax-highlighting # zsh 插件：语法高亮
		#(bilibili.overrideAttrs {
		# src = fetchurl {
		# url = "";
		# hash = "";
		# };
		# })
	];

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};
}
