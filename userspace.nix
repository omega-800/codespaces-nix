# SPDX-License-Identifier: Unlicense

{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d8f2c4d846a2e65ad3f5a5e842b672f0b81588a2.tar.gz") {}
}:

let
  systemPackages = with pkgs; [
    acl
    git
    nix
  ];
in

{
  inherit pkgs;
  nixpkgs = pkgs;

  inherit systemPackages;
  userPackages = systemPackages ++ (with pkgs; [
    home-manager
    man
    vim

    bzip2
    lorri
    procps
    psmisc
    unzip
    zip
  ]);
}
