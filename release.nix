{ supportedSystems ? [ "x86_64-linux" "i686-linux" ], supportedSystems2 ? [ "x86_64-linux" "i686-linux" "armv6l-linux" ] }:

with import <nixpkgs/lib>;

let
  pkgs = import <nixpkgs> { config = {}; };
  forAllSystems = genAttrs supportedSystems;
  forAllSystems2 = genAttrs supportedSystems2;
  importTest = fn: args: system: import fn ({
    inherit system;
  } // args);
  callTest = fn: args: forAllSystems (system: hydraJob (importTest fn args system));
  callSubTests = fn: args: let
    discover = attrs: let
      subTests = filterAttrs (const (hasAttr "test")) attrs;
    in mapAttrs (const (t: hydraJob t.test)) subTests;

    discoverForSystem = system: mapAttrs (_: test: {
      ${system} = test;
    }) (discover (importTest fn args system));
  # If the test is only for a particular system, use only the specified
  # system instead of generating attributes for all available systems.
  in if args ? system then discover (import fn args)
     else foldAttrs mergeAttrs {} (map discoverForSystem supportedSystems);
  platforms = (import <nixpkgs> { config = {}; }).platforms;
  platformForSystem = system: if system == "armv7l-linux" then platforms.raspberrypi2 else null;
  fetchClosure = f: forAllSystems (system: f (import ./default.nix { inherit system; }).config );
  fetchClosure2 = f: forAllSystems2 (system: f (import ./default.nix { inherit system; platform = platformForSystem system; }).config );
in
{
  tests.boot = callSubTests tests/boot.nix {};
  closureSizes = {
    toplevel = fetchClosure2 (cfg: cfg.system.build.toplevel);
    initialRamdisk = fetchClosure2 (cfg: cfg.system.build.initialRamdisk);
    squashed = fetchClosure2 (cfg: cfg.system.build.squashfs);
  };
  raspberrypi-tools = (import <nixpkgs> { config = {}; system = "armv7l-linux"; }).raspberrypi-tools;
  dist_test = fetchClosure2 (cfg: pkgs.runCommand "dist" { inherit (cfg.system.build) dist kernel; config = cfg.system.build.kernel.configfile; }''
    #!/bin/sh
    mkdir -p $out/nix-support
    echo file kernel ''${dist}/kernel > $out/nix-support/hydra-build-products
    echo file rootfs ''${dist}/root.squashfs >> $out/nix-support/hydra-build-products
    echo file initrd ''${dist}/initrd >> $out/nix-support/hydra-build-products
    echo file command-line ''${dist}/command-line >> $out/nix-support/hydra-build-products
    cd $out
    ln -sv ''${dist}/initrd
    ln -sv ''${dist}/kernel
    ln -sv ''${dist}/root.squashfs
    ln -sv ''${config} config
    for x in $kernel/dtbs/*;do ln -sv $x $out/;done
  '');
}
