kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both additional features and
performance/scalability improvements to the entire kernel.

**List of patches for 3.18.x**

- bfs: BFS v460 ([Con Colivas' low-latency CPU scheduler](http://ck-hack.blogspot.com/))
- btrfs: fixes for filesystem corruption, error handling, RAID 5/6 scrub/replace, block group GC, improved TRIM
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- net: TSO improvements

To apply over a -stable release simply run `patch -s -p1 < <patch-path/version/*>` when
in the kernel directory, and build as usual.

The currently **required minimum** -stable release is **3.18.0**; unless otherwise
noted any later 3.18-stable release should work as well.

The `master` branch always contains the currently active version; older series can
be found in their respective branches (e.g. `3.14`).
