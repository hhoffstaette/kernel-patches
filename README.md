kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a -stable release:

- check out the branch you want, or use master for the current stable version
- run `patch -s -p1 < ../kernel-patches/version/*.patch` when in the kernel directory
- build as usual

You can disable e.g. BFS (but why? :) via menuconfig, but all patches of a series
must be applied, as some have interdependencies (e.g. btrfs/block/vfs layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**Current stable series: >=4.0.6**

- bfs: [BFS v462](http://ck-hack.blogspot.com/2015/04/bfs-462-linux-40-ck1.html)
- bfq: BFQ v7r8 ([Budget Fair Queueing I/O scheduler](http://algogroup.unimore.it/people/paolo/disk_sched/))
- btrfs: fixes from 3.19-4.2+ (cleanups, data loss, performance, subvolumes, TRIM)
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- net: r8169 support for Byte Queue Limits & xmit_more
- vfs: scalability fixes

