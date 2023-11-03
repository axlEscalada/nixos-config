{ lib, stdenv, pkgs, src }:

stdenv.mkDerivation {
  name = "commitmono-font";
  dontConfigue = true;
  src = pkgs.fetchzip {
    url = "https://github.com/eigilnikolajsen/commit-mono/releases/download/v1.139/CommitMono-1.139.zip";
    # url =    "https://freefontsvault.s3.amazonaws.com/2020/02/Gill-Sans-Font-Family.zip";
    sha256 = "sha256-YcZUKzRskiqmEqVcbK/XL6ypsNMbY49qJYFG3yZVF78=";
    stripRoot = false;
  };
  installPhase = ''
    mkdir -p $out/share/fonts
    cp -R $src $out/share/fonts/commitmono/
  '';
  meta = { description = "Commit Mono Font Family derivation."; };
}