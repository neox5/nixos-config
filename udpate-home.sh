#!/bin/sh
pushd ~/.nixos-config
nix build .#homeManagerConfigurations.neox5.activationPackage
./result/activate
popd
