{ config, lib, pkgs, ... }:

{
	networking.hostName = "nixos";
	networking.networkmanager.enable = true;
	networking.nftables.enable = true;
	networking.firewall = {
		trustedInterfaces = [ "virbr0" "Mihomo" ];
		extraReversePathFilterRules = ''
			iifname { "Mihomo" } accept comment "trusted interface"
			'';
	};
}
