{pkgs, ... }:

{
	home.stateVersion = "26.05";
	home.username = "shorin";
	home.homeDirectory = "/home/shorin";

# 安装软件包
	home.packages = with pkgs; [
		starship
			eza
			ascii
			ctags
			lazygit
			tree
			btop
			yazi
			opencode
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
			zsh-syntax-highlighting # zsh 插件：语法高亮
#(bilibili.overrideAttrs {
# src = fetchurl {
# url = "";
# hash = "";
# };
# })
			];

	programs.zoxide = {
		enable = true;
# 为你的常用 Shell 开启集成，比如 Bash 或 Zsh
		package = pkgs.zoxide;
		enableBashIntegration = true;
		enableZshIntegration = true;
# 可选：用 'cd' 命令直接替代原生的 cd
		options = [ "--cmd cd" ];
	};

	programs.fzf = {
		enable = true;
# 为你使用的 Shell 开启快捷键集成 (CTRL-R, ALT-C 等)
		package = pkgs.fzf;
		enableBashIntegration = true;  # 如果用 Bash
			enableZshIntegration = true;   # 如果用 Zsh
	};
}
