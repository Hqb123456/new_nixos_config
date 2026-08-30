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

  # 启用 virt-manager 程序
  programs.virt-manager.enable = true;

  # 启用 libvirt 虚拟化守护进程
  virtualisation.libvirtd.enable = true;

  # （可选）启用 SPICE USB 重定向，提升虚拟机USB设备体验
  virtualisation.spiceUSBRedirection.enable = true;

  # 用户组
  users.users.shorin.extraGroups = [ "libvirtd" "docker" "incus-admin" ];
}
