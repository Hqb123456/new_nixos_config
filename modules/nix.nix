{ config, lib, pkgs, ... }:
{
	nix = {
		settings = {
			substituters = lib.mkForce [
				"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
					"https://mirror.sjtu.edu.cn/nix-channels/store"
#"https://mirrors.cernet.edu.cn/nix-channels/store"
#"https://mirrors.ustc.edu.cn/nix-channels/store"
					"https://noctalia.cachix.org"
			];
			trusted-substituters = [
				"https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
					"https://mirror.sjtu.edu.cn/nix-channels/store"
#"https://mirrors.cernet.edu.cn/nix-channels/store"
#"https://mirrors.ustc.edu.cn/nix-channels/store"
					"https://noctalia.cachix.org"
			];
			trusted-public-keys = [
				"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
					"noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
			];
			experimental-features = [ "nix-command" "flakes" ];
		};
	};
}
