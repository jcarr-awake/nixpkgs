{ lib, stdenv, fetchurl, pkg-config, libnl, openssl, sqlite ? null }:

stdenv.mkDerivation rec {
  pname = "hostapd";
  version = "2.10";

  src = fetchurl {
    url = "https://w1.fi/releases/${pname}-${version}.tar.gz";
    sha256 = "sha256-IG58eZtnhXLC49EgMCOHhLxKn4IyOwFWtMlGbxSYkV0=";
  };

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ libnl openssl sqlite ];

  patches = [
    (fetchurl {
      # Note: fetchurl seems to be unhappy with openwrt git
      # server's URLs containing semicolons. Using the github mirror instead.
      url = "https://raw.githubusercontent.com/openwrt/openwrt/eefed841b05c3cd4c65a78b50ce0934d879e6acf/package/network/services/hostapd/patches/300-noscan.patch";
      sha256 = "08p5frxhpq1rp2nczkscapwwl8g9nc4fazhjpxic5bcbssc3sb00";
    })
    # SAE/EAP-pwd side-channel attack update 2
    # https://w1.fi/security/2022-1/
    (fetchurl {
      name = "0001-crypto-Add-more-bignum-EC-helper-functions.patch";
      url = "https://w1.fi/security/2022-1/0001-crypto-Add-more-bignum-EC-helper-functions.patch";
      sha256 = "0gq14p4vrg4sn8dhqylidjrcm2y4v1pj758k6zin61nvfy9b9xrl";
    })
    (fetchurl {
      name = "0002-dragonfly-Add-sqrt-helper-function.patch";
      url = "https://w1.fi/security/2022-1/0002-dragonfly-Add-sqrt-helper-function.patch";
      sha256 = "0jwdrb3lvazryahr4vkp4mgfx9699c63bknllvaw4kkc0ashvql4";
    })
    (fetchurl {
      name = "0003-SAE-Derive-the-y-coordinate-for-PWE-with-own-impleme.patch";
      url = "https://w1.fi/security/2022-1/0003-SAE-Derive-the-y-coordinate-for-PWE-with-own-impleme.patch";
      sha256 = "09fmnvnl64gp17hxf1kz6aza6zjn2zxvmp7i917yssjc27n3ag6f";
    })
    (fetchurl {
      name = "0004-EAP-pwd-Derive-the-y-coordinate-for-PWE-with-own-imp.patch";
      url = "https://w1.fi/security/2022-1/0004-EAP-pwd-Derive-the-y-coordinate-for-PWE-with-own-imp.patch";
      sha256 = "17lya82bq923lvxafnb80xvmw0v1z8l56dbgnbllwz79zzzsxdfn";
    })

  ];

  outputs = [ "out" "man" ];

  extraConfig = ''
    CONFIG_DRIVER_WIRED=y
    CONFIG_LIBNL32=y
    CONFIG_EAP_SIM=y
    CONFIG_EAP_AKA=y
    CONFIG_EAP_AKA_PRIME=y
    CONFIG_EAP_PAX=y
    CONFIG_EAP_PWD=y
    CONFIG_EAP_SAKE=y
    CONFIG_EAP_GPSK=y
    CONFIG_EAP_GPSK_SHA256=y
    CONFIG_EAP_FAST=y
    CONFIG_EAP_IKEV2=y
    CONFIG_EAP_TNC=y
    CONFIG_EAP_EKE=y
    CONFIG_RADIUS_SERVER=y
    CONFIG_IEEE80211R=y
    CONFIG_IEEE80211N=y
    CONFIG_IEEE80211AC=y
    CONFIG_FULL_DYNAMIC_VLAN=y
    CONFIG_VLAN_NETLINK=y
    CONFIG_TLS=openssl
    CONFIG_TLSV11=y
    CONFIG_TLSV12=y
    CONFIG_INTERNETWORKING=y
    CONFIG_HS20=y
    CONFIG_ACS=y
    CONFIG_GETRANDOM=y
    CONFIG_SAE=y
  '' + lib.optionalString (sqlite != null) ''
    CONFIG_SQLITE=y
  '';

  configurePhase = ''
    cd hostapd
    cp -v defconfig .config
    echo "$extraConfig" >> .config
    cat -n .config
    substituteInPlace Makefile --replace /usr/local $out
    export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE $(pkg-config --cflags libnl-3.0)"
  '';

  preInstall = "mkdir -p $out/bin";
  postInstall = ''
    install -vD hostapd.8 -t $man/share/man/man8
    install -vD hostapd_cli.1 -t $man/share/man/man1
  '';

  meta = with lib; {
    homepage = "https://hostap.epitest.fi";
    repositories.git = "git://w1.fi/hostap.git";
    description = "A user space daemon for access point and authentication servers";
    license = licenses.gpl2;
    maintainers = with maintainers; [ ninjatrappeur hexa ];
    platforms = platforms.linux;
  };
}
