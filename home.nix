{ pkgs, caelestia-shell, lib, ... }:

{
	imports = [
		caelestia-shell.homeManagerModules.default
	];

	home.stateVersion = "26.05";
	home.username = "shorin";
	home.homeDirectory = "/home/shorin";

# 安装软件包
	home.packages = with pkgs; [
			opencode-desktop
			vscode
			onlyoffice-desktopeditors
			spotify
			vlc
			folia-major
			ghostty
			hmcl
			starship
			eza
			ascii
			ctags
			lazygit
			tree
			btop
			yazi
#opencode
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
			wechat
			(bilibili.overrideAttrs {
			 version = "1.19.0-3";
			 src = fetchurl {
			 url = "https://gh-proxy.org/https://github.com/msojocs/bilibili-linux/releases/download/v1.19.0-3/io.github.msojocs.bilibili_1.19.0-3_amd64.deb";
			 hash = "sha256-ydDcF6SMZLT8TatR/WkGbhKwXPlo/CGChKYwMcHqCoE=";
			 };
			 })
	];

	programs.zsh={
		enable = true;
		enableCompletion = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		oh-my-zsh = {
			enable = true;
			plugins = [ "sudo" "git" "z" "extract" "fzf" "docker" "colored-man-pages" "history-substring-search" "web-search" "aliases" "copypath" "dirhistory" "zsh-navigation-tools"]; # 按需添加插件
				theme = "junkfood";        # 指定主题
		};
	};

	programs.fzf = {
		enable = true;
		enableZshIntegration = true;
	};

	programs.caelestia = {
		enable = true;
		cli.enable = true;
		systemd.enable = false; # 你将在 Hyprland 中手动启动
	};

# 解决 shell.json 只读问题
	home.activation.caelestiaWritableShellConfig = lib.hm.dag.entryAfter ["linkGeneration"] ''
		if [ -L "$HOME/.config/caelestia/shell.json" ]; then
			$DRY_RUN_CMD cp --remove-destination \
				"$(readlink -f "$HOME/.config/caelestia/shell.json")" \
				"$HOME/.config/caelestia/shell.json"
				fi
				'';
}
