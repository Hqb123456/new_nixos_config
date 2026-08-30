{ config, lib, pkgs, ... }:

{
	i18n.inputMethod = {
		type = "fcitx5";
		enable = true;
		fcitx5 = {
			addons = with pkgs; [
				fcitx5-gtk
					(libsForQt5.fcitx5-qt)
					qt6Packages.fcitx5-chinese-addons
			];
		};
	};

	environment.sessionVariables = {
#GTK_IM_MODULE = "fcitx";
		QT_IM_MODULE = "fcitx";
		XMODIFIERS = "@im=fcitx";
	};

	environment.variables = {
		QT_QPA_PLATFORM_PLUGIN_PATH = "${pkgs.qt6.qtbase.outPath}/lib/qt-6/plugins";
	};

	i18n.defaultLocale = "zh_CN.UTF-8";

	i18n.extraLocaleSettings = {
		LC_TIME = "zh_CN.UTF-8";
		LC_MONETARY = "zh_CN.UTF-8";
	};

	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
	};

}
