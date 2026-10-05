{pkgs, ... }:

{
	home.stateVersion = "26.05";
	home.username = "shorin";
	home.homeDirectory = "/home/shorin";

# 安装软件包
	home.packages = with pkgs; [
		neovide
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

	programs.nixvim = {
  enable = true;

  globals.mapleader = " ";

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = false;
    };
  };

  plugins = {
    # 代码补全
    cmp = {
      enable = true;
      settings.sources = [
        { name = "nvim_lsp"; }
        { name = "buffer"; }
        { name = "path"; }
      ];
    };
    cmp-nvim-lsp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    luasnip.enable = true;

    # 文件搜索与导航
    telescope.enable = true;

    # 文件树
    nvim-tree.enable = true;

    # 语法高亮与解析
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;
      folding.enable = true;
    };

    # Git 集成
    gitsigns.enable = true;

    # 状态栏
    lualine.enable = true;

    # 键位提示
    which-key.enable = true;

    # UI 增强
    notify.enable = true;

    # 编辑增强
    nvim-autopairs.enable = true;
    comment.enable = true;
  };

  # LSP 配置
  lsp.servers = {
    nil_ls.enable = true;
    lua_ls.enable = true;
    clangd = {
      enable = true;
      config = {
        cmd = [ "clangd" "--background-index" "--clang-tidy" ];
        root_markers = [ "compile_commands.json" "compile_flags.txt" ".git" ];
      };
    };
  };

  # 编辑器选项（与 lsp、plugins 平级）
  opts = {
    number = true;
    relativenumber = true;
  };
};
}
