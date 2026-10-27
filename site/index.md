---
title: not-os
---


not-os is a minimal OS based on the Linux kernel, coreutils, runit, and Nix. It
is also the build script, written in Nix expressions, to build such OS.

This is a project of Michael Bishop (cleverca22 on GitHub, clever on IRC). I
modified it just a bit to make it possible to generate this documentation.

As a build tool, not-os uses nixpkgs and in particular the [NixOS module
system](https://nixos.wiki/wiki/NixOS_Modules) to build the three main
components of a Linux-based operating system:

- a kernel (`config.system.build.kernel`)
- an initrd (`config.system.build.initialRamdisk`)
- a rootfs (`config.system.build.squashfs`)

Given the three above derivations, it is possible to generate the appropriate
qemu-kvm invocation as a script, [runvm](runvm.md). runvm is the main entry
point to start playing and understanding not-os. Follow that link, or any one
of those at the bottom of each page, and enjoy!

<br />
<br />
*To follow along, you can clone [the Git
repository](https://github.com/noteed/not-os/) and run each `nix-build` command
as they appear at the top of each page.*


<hr />


<div class="mv5 flex-ns">
<section class="w-60-ns pr4 mb5">
<h1 class="f5 ttu lh-title mb3">Intro</h1>
<ul class="list pa0 ma0 lh-copy">
  <li class=mr4><a href="/not-os/index.html">not-os</a></li>
</ul>
<br />
<h1 class="f5 ttu lh-title mb3">Notes</h1>
<ul class="list pa0 ma0 lh-copy">
  <li class=mr4><a href="/not-os/digital-ocean.html">Digital Ocean</a></li>
  <li class=mr4><a href="/not-os/todo.html">TODO</a></li>
</ul>
</section>
<section class="w-70-ns pr4 mb5">
<h1 class="f5 ttu lh-title mb3">Main attributes</h1>
<ul class="list pa0 ma0 lh-copy">
  <li class=mr4><a href="/not-os/runvm.html">runvm</a></li>
  <li class=mr4><a href="/not-os/kernel.html">kernel</a></li>
  <li class=mr4><a href="/not-os/initrd.html">initrd</a></li>
  <li class=mr4><a href="/not-os/rootfs.html">rootfs</a></li>
  <li class=mr4><a href="/not-os/ext4.html">ext4</a></li>
  <li class=mr4><a href="/not-os/stage-1.html">stage-1</a></li>
  <li class=mr4><a href="/not-os/stage-2.html">stage-2</a></li>
  <li class=mr4><a href="/not-os/dist.html">dist</a></li>
  <li class=mr4><a href="/not-os/extra-utils.html">extra-utils</a></li>
  <li class=mr4><a href="/not-os/path.html">path</a></li>
  <li class=mr4><a href="/not-os/shrunk.html">shrunk</a></li>
  <li class=mr4><a href="/not-os/toplevel.html">toplevel</a></li>
  <li class=mr4><a href="/not-os/boot.html">boot</a></li>
  <li class=mr4><a href="/not-os/ext4.html">ext4</a></li>
  <li class=mr4><a href="/not-os/raw.html">raw</a></li>
  <li class=mr4><a href="/not-os/qcow2.html">qcow2</a></li>
  <li class=mr4><a href="/not-os/syslinux.html">syslinux</a></li>
</ul>
</section>
<section class="w-50-ns pr4 mb5">
<h1 class="f5 ttu lh-title mb3">Values</h1>
<ul class="list pa0 ma0 lh-copy">
  <li class=mr4><a href="/not-os/cmdline.html">cmdline</a></li>
  <li class=mr4><a href="/not-os/root-modules.html">root-modules</a></li>
</ul>
<br />
<h1 class="f5 ttu lh-title mb3">Source</h1>
<ul class="list pa0 ma0 lh-copy">
  <li class=mr4><a href="/not-os/default.html">default.nix</a></li>
</ul>
</section>
</div>
