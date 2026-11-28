
{
  inputs = {
    # nixpkgs：继续使用清华镜像
    nixpkgs-unstable.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs.git?ref=nixpkgs-unstable&shallow=1";

    # Home Manager
    home-manager = {
      url = "git+https://github.com/nix-community/home-manager.git?ref=master&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Noctalia
    noctalia = {
      url = "git+https://github.com/noctalia-dev/noctalia.git?ref=cachix&shallow=1";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # Caelestia Shell
    caelestia-shell = {
      url = "git+https://github.com/caelestia-dots/shell.git";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.caelestia-cli.url = "git+https://github.com/caelestia-dots/cli.git";
    };

    # KWin Better Blur DX
    kwin-effects-better-blur-dx = {
      url = "github:xarblu/kwin-effects-better-blur-dx";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    # MS-IME
    msime = {
      url = "github:metasequoiaime/msime";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = {
    self,
    nixpkgs-unstable,
    home-manager,
    noctalia,
    caelestia-shell,
    kwin-effects-better-blur-dx,
    msime,
    ...
  }:
    let
      lib = nixpkgs-unstable.lib;
    in
    {
      nixosConfigurations.nixos = lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit
            home-manager
            noctalia
            caelestia-shell
            kwin-effects-better-blur-dx
            ;
        };

        modules = [
          home-manager.nixosModules.default

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bak";

              extraSpecialArgs = {
                inherit caelestia-shell;
              };

              users.shorin = {
                imports = [
                  ./home.nix
                ];
              };
            };
          }

          ./configuration.nix
          noctalia.nixosModules.default
          msime.nixosModules.default
        ];
      };
    };
}

