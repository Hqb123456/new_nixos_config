{ config, lib, pkgs, ... }:
{
  # ========== 内核参数 ==========
  boot.kernelParams = [
    "nvidia_drm.modeset=1"  # Wayland 必需
    # 如果遇到黑屏，可以添加：
    # "nvidia_drm.fbdev=1"
  ];
  
  # ========== 内核模块配置 ==========
  boot.extraModprobeConfig = ''
    # Nvidia 电源管理参数
    options nvidia NVreg_EnableGpuFirmware=0
    options nvidia NVreg_EnableS0ixPowerManagement=0
    # 声卡参数（保留你的）
    options snd-hda-intel probe_mask=1
  '';
  
  # 确保 Nouveau 被禁用
  boot.blacklistedKernelModules = [ "nouveau" ];
  
  # ========== Intel 核显 ==========
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # ========== NVIDIA RTX 4060 ==========
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    open = true;  # RTX 4060 使用开源内核模块
    modesetting.enable = true;
    nvidiaSettings = true;
    
    # 电源管理（建议保持关闭，除非遇到休眠问题）
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    
    # 使用稳定版驱动
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    
    # 双显卡 PRIME 配置
    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  
  # ========== 蓝牙 ==========
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
}
