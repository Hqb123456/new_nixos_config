{ config, lib, pkgs, ... }:

{
  # Docker
  virtualisation.docker.enable = true;
  virtualisation.docker.daemon.settings = {
    registry-mirrors = [
      "https://docker.m.daocloud.io"
      "https://docker.1ms.run"
      "https://docker.xuanyuan.me"
    ];
  };

  # LXC 底层容器运行时
  virtualisation.lxc.enable = true;
  virtualisation.lxc.lxcfs.enable = true;

  # Incus（LXD 社区继承者）
  virtualisation.incus.enable = true;

  # 用户组
  users.users.shorin.extraGroups = [ "docker" "incus-admin" ];
}
