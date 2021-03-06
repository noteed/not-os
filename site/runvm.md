---
title: not-os
---

## runvm

```
$ nix-build -A runvm
@result@
```

runvm is the main derivation of not-os. It is defined in
[`default.nix`](default.html). Every other derivation is a dependency.

The result is (a symlink to) a script calling qemu-kvm with the right
parameters, in particular the kernel &#x24B6;, the initrd &#x24B7;, and the
rootfs &#x24B8;.

<pre><code>
@runvm@
</code></pre>

*Note: artificial newlines added.*

A kernel command line &#x24B9; is used to let the stage-1 know about the
location of toplevel;


### Example execution

Executing the resulting script looks like:

```
$ ./result
Entering stage-1...
/nix/store/1mq5jkzjcy2g2ypah1b9f848l00m5whq-stage-1
Creating base file systems...
Using /nix/store/w5dbz7ig5s3g0c1xz7aqqs9klghhq4lm-extra-utils...
Using /nix/store/70jf5sm6750jbbsirv6rqihwj22gsbvj-linux-4.14.84-shrunk...
Loading kernel module virtio...
Loading kernel module virtio_pci...
Loading kernel module virtio_net...
Loading kernel module virtio_rng...
Loading kernel module virtio_blk...
Loading kernel module virtio_console...
Loading kernel module dm_mod...
Loading kernel module tun...
Loading kernel module loop...
Loading kernel module squashfs...
Loading kernel module overlay...
Creating writable Nix store...
Switching root filesystem...

Entering stage-2...
/nix/store/w1g8p9zi8apj336xk177q2y6ddcp04nn-stage-2
Creating base file systems...
Using /nix/store/2whzzgy0ivkp6vw3i67w51kf78ij87n4-toplevel...
setting up /etc...
- runit: $Id: 25da3b86f7bed4038b8a039d2f8e8c9bbcf0822b $: booting.
- runit: enter stage: /etc/runit/1
Setting static IP address...
Running ntpdate...
23 Mar 14:20:27 ntpdate[108]: step time server 193.190.253.212 offset -2.542015 sec
- runit: leave stage: /etc/runit/1
- runit: enter stage: /etc/runit/2
Running runsvdir...
Running nix-daemon...
Running sshd...
QEMU: Terminated
```

You can type `ctrl-a x` to quit. You can also enter the QEMU monitor with
`ctrl-a c`, then e.g. type `screendump filename.ppm` to capture an image like
the one in the test, then `quit` to terminate QEMU.


<br />
@footer@
