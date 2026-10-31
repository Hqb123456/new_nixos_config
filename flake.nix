{
	inputs = {
		nixpkgs-unstable.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixpkgs-unstable&shallow=1";

		home-manager = {
			url = "git+https://gh-proxy.org/https://github.com/nix-community/home-manager.git?ref=master&shallow=1";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};

		noctalia = {
			url = "git+https://gh-proxy.org/https://github.com/noctalia-dev/noctalia.git?ref=cachix&shallow=1";
			inputs.nixpkgs.follows = "nixpkgs-unstable";  # 加上这一行
		};

# caelestia-shell = {
#   url = "git+https://gh-proxy.org/https://github.com/caelestia-dots/shell";
# 	# url = "github:caelestia-dots/shell";
# 	inputs.nixpkgs.follows = "nixpkgs-unstable";  # 关键修正：跟随你实际使用的 nixpkgs
# };
		caelestia-shell = {
			url = "git+https://gh-proxy.org/https://github.com/caelestia-dots/shell";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
			inputs.caelestia-cli.url = "git+https://gh-proxy.org/https://github.com/caelestia-dots/cli";
		};
		kwin-effects-better-blur-dx = {
			url = "github:xarblu/kwin-effects-better-blur-dx";
			inputs.nixpkgs.follows = "nixpkgs-unstable";
		};
	};

	outputs = { self, nixpkgs-unstable, home-manager, noctalia, caelestia-shell, kwin-effects-better-blur-dx, ... }:
		let
		lib = nixpkgs-unstable.lib;
	in
	{
		nixosConfigurations.nixos = lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = {
				inherit home-manager noctalia caelestia-shell kwin-effects-better-blur-dx;
			};
			modules = [
			home-manager.nixosModules.default
			{
				home-manager = {
					useGlobalPkgs = true;
					useUserPackages = true;
					backupFileExtension = "bak";
					extraSpecialArgs = { inherit caelestia-shell; };  # 让 home.nix 能拿到 inputs.caelestia-shell
						users.shorin = {
							imports = [
								./home.nix
							];
						};
				};
			}
			./configuration.nix
				noctalia.nixosModules.default
				];
		};
	};
}
