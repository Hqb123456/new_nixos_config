{config, pkgs, ... }:

{
	home.stateVersion = "26.05";
	home.username = "shorin";
	home.homeDirectory = "/home/shorin";

# 安装软件包
	home.packages = with pkgs; [
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
			zsh-powerlevel10k       # zsh 主题
			zsh-syntax-highlighting # zsh 插件：语法高亮
#(bilibili.overrideAttrs {
# src = fetchurl {
# url = "";
# hash = "";
# };
# })
			];

	# 启用 Starship
  programs.starship = {
    enable = true;

    # 在这里直接编写你的 Starship 配置
    settings =
{ "$schema" = "https://starship.rs/config-schema.json"; bun = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; c = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = " "; }; character = { disabled = false; error_symbol = "[](bold fg:color_red)"; success_symbol = "[](bold fg:color_green)"; vimcmd_replace_one_symbol = "[](bold fg:color_purple)"; vimcmd_replace_symbol = "[](bold fg:color_purple)"; vimcmd_symbol = "[](bold fg:color_green)"; vimcmd_visual_symbol = "[](bold fg:color_yellow)"; }; conda = { format = "[[ $symbol( $environment) ](fg:#83a598 bg:color_bg3)]($style)"; style = "bg:color_bg3"; }; cpp = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = " "; }; directory = { format = "[ $path ]($style)"; style = "fg:color_fg0 bg:color_yellow"; substitutions = { Developer = "󰲋 "; Documents = "󰈙 "; Downloads = " "; Music = "󰝚 "; Pictures = " "; }; truncation_length = 3; truncation_symbol = "~/"; }; docker_context = { format = "[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)"; style = "bg:color_bg3"; symbol = ""; }; format = "[](color_orange)$os$username[](bg:color_yellow fg:color_orange)$directory[](fg:color_yellow bg:color_aqua)$git_branch$git_status[](fg:color_aqua bg:color_blue)$c$cpp$rust$golang$nodejs$bun$php$java$kotlin$haskell$python[](fg:color_blue bg:color_bg3)$docker_context$conda$pixi[](fg:color_bg3 bg:color_bg1)$time[ ](fg:color_bg1)$line_break$character"; git_branch = { format = "[[ $symbol $branch ](fg:color_fg0 bg:color_aqua)]($style)"; style = "bg:color_aqua"; symbol = ""; }; git_status = { format = "[[($all_status$ahead_behind )](fg:color_fg0 bg:color_aqua)]($style)"; style = "bg:color_aqua"; }; golang = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; haskell = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; java = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; kotlin = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; line_break = { disabled = false; }; nodejs = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; os = { disabled = false; style = "bg:color_orange fg:color_fg0"; symbols = { AOSC = ""; Alpine = ""; Amazon = ""; Android = ""; Arch = "󰣇"; Artix = "󰣇"; CentOS = ""; Debian = "󰣚"; EndeavourOS = ""; Fedora = "󰣛"; Gentoo = "󰣨"; Linux = "󰌽"; Macos = "󰀵"; Manjaro = ""; Mint = "󰣭"; Pop = ""; Raspbian = "󰐿"; RedHatEnterprise = "󱄛"; Redhat = "󱄛"; SUSE = ""; Ubuntu = "󰕈"; Windows = "󰍲"; }; }; palette = "gruvbox_dark"; palettes = { gruvbox_dark = { color_aqua = "#689d6a"; color_bg1 = "#3c3836"; color_bg3 = "#665c54"; color_blue = "#458588"; color_fg0 = "#fbf1c7"; color_green = "#98971a"; color_orange = "#d65d0e"; color_purple = "#b16286"; color_red = "#cc241d"; color_yellow = "#d79921"; }; }; php = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; pixi = { format = "[[ $symbol( $version)( $environment) ](fg:color_fg0 bg:color_bg3)]($style)"; style = "bg:color_bg3"; }; python = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; rust = { format = "[[ $symbol( $version) ](fg:color_fg0 bg:color_blue)]($style)"; style = "bg:color_blue"; symbol = ""; }; time = { disabled = false; format = "[[  $time ](fg:color_fg0 bg:color_bg1)]($style)"; style = "bg:color_bg1"; time_format = "%R"; }; username = { format = "[ $user ]($style)"; show_always = true; style_root = "bg:color_orange fg:color_fg0"; style_user = "bg:color_orange fg:color_fg0"; };
    };
  };

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

	programs.zsh = {
		enable = true;
		shellAliases = {
			ff = "fastfetch"; 
			ls = "eza --icons";          # 基础替代，带图标
				ll = "eza -l --icons";       # 显示详细信息
				la = "eza -la --icons";      # 显示所有文件（包括隐藏文件）
				lt = "eza --tree --icons";   # 树形查看
		};
	};
}
