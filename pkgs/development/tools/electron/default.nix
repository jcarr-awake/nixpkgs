{ lib, stdenv
, libXScrnSaver
, makeWrapper
, fetchurl
, wrapGAppsHook
, glib
, gtk3
, unzip
, atomEnv
, libuuid
, at-spi2-atk
, at-spi2-core
, libdrm
, mesa
, libxkbcommon
, libappindicator-gtk3
, libxshmfence
, libglvnd
}@args:

let
  mkElectron = import ./generic.nix args;
in
rec {

  electron = electron_17;

  electron_9 = mkElectron "9.4.4" {
    x86_64-linux = "781d6ca834d415c71078e1c2c198faba926d6fce19e31448bbf4450869135450";
    x86_64-darwin = "f41c0bf874ddbba00c3d6989d07f74155a236e2d5a3eaf3d1d19ef8d3eb2256c";
    i686-linux = "40e37f8f908a81c9fac1073fe22309cd6df2d68e685f83274c6d2f0959004187";
    armv7l-linux = "2dfe3e21d30526688cc3d3215d06dfddca597a2cb62ff0c9d0d5f33d3e464a33";
    aarch64-linux = "f1145e9a1feb5f2955e5f5565962423ac3c52ffe45ccc3b96c6ca485fa35bf27";
    headers = "0yx8mkrm15ha977hzh7g2sc5fab9sdvlk1bk3yxignhxrqqbw885";
  };

  electron_10 = mkElectron "10.4.7" {
    x86_64-linux = "e3ea75fcedce588c6b59cfa3a6e46ba67b789e14dc2e5b9dfe1ddf3f82b0f995";
    x86_64-darwin = "8f01e020563b7fce68dc2e3d4bbf419320d13b088e89eb64f9645e9d73ad88fb";
    i686-linux = "dd7fde9b3993538333ec701101554050b27d0b680196d0883ab563e8e696fc79";
    armv7l-linux = "56f11ed14f8a620650d31c21ebd095ce59ef4286c98276802b18f9cc85560ddd";
    aarch64-linux = "0550584518c8e98fe1113706c10fd7456ec519f7aa6867fbff17c8913327d758";
    headers = "01x6a0r2jawjpl09ixgzap3g0z6znj34hsnnhzanavkbds0ri4k6";
  };

  electron_11 = mkElectron "11.5.0" {
    x86_64-linux = "613ef8ac00c5abda425dfa48778a68f58a2e9c7c1f82539bb1a41afabbd6193f";
    x86_64-darwin = "32937dca29fc397f0b15dbab720ed3edb88eee24f00f911984b307bf12dc8fd5";
    i686-linux = "cd154c56d02d7b1f16e2bcd5650bddf0de9141fdbb8248adc64f6d607e5fb725";
    armv7l-linux = "3f5a41037aaad658051d8bc8b04e8dece72b729dd1a1ed8311b365daa8deea76";
    aarch64-linux = "f698a7743962f553fe36673f1c85bccbd918efba8f6dca3a3df39d41c8e2de3e";
    aarch64-darwin = "749fb6bd676e174de66845b8ac959985f30a773dcb2c05553890bd99b94c9d60";
    headers = "1zkdgpjrh1dc9j8qyrrrh49v24960yhvwi2c530qbpf2azgqj71b";
  };

  electron_12 = mkElectron "12.2.3" {
    armv7l-linux = "4de83c34987ac7b3b2d0c8c84f27f9a34d9ea2764ae1e54fb609a95064e7e71a";
    aarch64-linux = "d29d234c09ba810d89ed1fba9e405b6975916ea208d001348379f89b50d1835c";
    x86_64-linux = "deae6d0941762147716b8298476080d961df2a32d0f6f57b244cbe3a2553cd24";
    i686-linux = "11b4f159cd3b89d916cc05b5231c2cde53f0c6fb5be8e881824fde00daa5e8c2";
    x86_64-darwin = "5af34f1198ce9fd17e9fa581f57a8ad2c9333187fb617fe943f30b8cde9e6231";
    aarch64-darwin = "0db2c021a047a4cd5b28eea16490e16bc82592e3f8a4b96fbdc72a292ce13f50";
    headers = "1idam1xirxqxqg4g7n33kdx2skk0r351m00g59a8yx9z82g06ah9";
  };

  electron_13 = mkElectron "13.6.9" {
    armv7l-linux = "e70cf80ac17850f3291c19a89235c59a7a6e0c791e7965805872ce584479c419";
    aarch64-linux = "cb570f77e46403a75b99740c41b297154f057dc3b9aa75fd235dccc5619972cf";
    x86_64-linux = "5e29701394041ba2acd8a9bb042d77967c399b8fe007d7ffbd1d3e6bfdb9eb8a";
    i686-linux = "7c31b60ee0e1d9966b8cf977528ace91e10ce25bb289a46eabbcf6087bee50e6";
    x86_64-darwin = "3393f0e87f30be325b76fb2275fe2d5614d995457de77fe00fa6eef2d60f331e";
    aarch64-darwin = "8471777eafc6fb641148a9c6acff2ea41c02a989d4d0a3a460322672d85169df";
    headers = "0vvizddmhprprbdf6bklasz6amwc254bpc9j0zlx23d1pgyxpnhc";
  };

  electron_14 = mkElectron "14.2.9" {
    armv7l-linux = "02ae6cd9ec9c2dcb2f550923576a0c851fff3e796a5048dd3806947c541fd564";
    aarch64-linux = "631ba0f716d0272931418de42468114360bd21ec72875605fc32d67620743d2c";
    x86_64-linux = "0a62a41e8ac4592aba347c82f9c40f3fb4c84c7d00b6bb9501d02375cd49cb7d";
    i686-linux = "55e395a209d4a90e2dcd20a78af4724355feaba86411a39e66b977ed39de4d05";
    x86_64-darwin = "1df5b4c4414ade75c6cbfe13d3024702b8ae7c77f3f07b8955b2459fde6a5842";
    aarch64-darwin = "17089e54830976c4216d26e7e2e15ad2224e3b288d94973fed7e67e9b1c213b3";
    headers = "181b2agnf4b5s81p2rdnd6wkw9c2ri4cv1x0wwf7rj60axvzvydm";
  };

  electron_15 = mkElectron "15.5.2" {
    armv7l-linux = "da434095fd7cc17d85ebca5eab3510ec7ff73ace4edc933fe2f27a716ca711c0";
    aarch64-linux = "bcec3f962c7acefc8690680a19df9d83721db7e5db55c7b7a8946365139457a6";
    x86_64-linux = "a4a95888c313dbe279f5f9d9dfd99f56a2a1b6b905fb6cba3b284322fe19a530";
    i686-linux = "0fd1dd9027bfdbc573fd39e163b6b3f8c07e8ac1586a554e65e7324e7fa7ea35";
    x86_64-darwin = "688cc1d501d32afa5efe1883be42446b61f404d4a5e84bd9815254b5437c869b";
    aarch64-darwin = "b43237d7612ada2f2dccaf6e13fa70ba938dc48f1e2f895558949dd372171db7";
    headers = "0jbxazkjkm8g8b8d0ini2l4q9z7885mz5vyj74lf85lqdfqzgzc0";
  };

  electron_16 = mkElectron "16.2.3" {
    armv7l-linux = "9b442b17349dcec08e6efadecf9d338a7f4b2955635fed2a78374af850ceee5d";
    aarch64-linux = "eec581d162b494a7bcba4b0221f3beac9f359b48fb8612c83ce6ad7ac63094cd";
    x86_64-linux = "2c032baff08b40f106dfcd86e7b63c6275f13e64d26b8c301af704563edf8600";
    i686-linux = "227e9f5670a2d92a814eeda41c7ef4efd8fc6150bee659e0f322a8d2481ecdec";
    x86_64-darwin = "3a51ad480d4085a822b0526018805e64fe82f93b954abe500eaebb3c81c80d45";
    aarch64-darwin = "38c736c336abf8747040f22542d6a0bd785b5a10f6ba01d71335cc5f77a3d0b5";
    headers = "1a9kb89iigwmahjwq14i74rr6gj21gmpc106pg0il73c50khaxpz";
  };

  electron_17 = mkElectron "17.1.2" {
    armv7l-linux = "b561c04c9fa8c512f418ea5c32f5526732e1ccd150ee4830a0091d0fa1b7e31c";
    aarch64-linux = "cda7e66c6672def9edd881107c28e2eec09b7802a38227ac89bb233191ce4840";
    x86_64-linux = "7e7c35e8c1a0fc451e7af19fa73264881ae2c4672c52a2ae1cdd61604650ca94";
    i686-linux = "de87a7952c93c1d8e8c533a700bbfc76d3893e9ad438413507d11450b80a9c97";
    x86_64-darwin = "d4382d3f01b750676a1f3c9e2273ad69cac16dc64a4145469c663bcda8d2471b";
    aarch64-darwin = "135dec87211fcefdb53ab1fef13344c7b71a321f7c4f6846f260c1e0848e73bf";
    headers = "15k234d044lgmc3psyxz9syy9wvzgn54znklak9sv6gcajjzll10";
  };
}
