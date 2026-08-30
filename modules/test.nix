{ pkgs, ... }:

let
  my-python-packages = python-packages: with python-packages; [
    pandas
    requests
    sexpdata
    tld
    pyqt6
    pyqt6-sip
    pyqt6-webengine
    epc
    lxml  # for eaf
    qrcode  # eaf-file-browser
    pysocks  # eaf-browser
    pymupdf  # eaf-pdf-viewer
    pypinyin  # eaf-file-manager
    psutil  # eaf-system-monitor
    retry  # eaf-markdown-previewer
    markdown
  ];
  
  python-with-my-packages = pkgs.python3.withPackages my-python-packages;
in {
  # 把自定义 Python 环境添加到系统包中
  environment.systemPackages = with pkgs; [
    python-with-my-packages
  ];
}
