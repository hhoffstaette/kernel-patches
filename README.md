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

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**LTS series: >=3.18.19**

- bfs: [BFS v460+](http://ck-hack.blogspot.de/2014/12/bfs-460-linux-318-ck1.html)
- bfq: [BFQ v7r8](http://algogroup.unimore.it/people/paolo/disk_sched/)
- block: discard/md corruption fix, improved CFQ SSD awareness
- btrfs: fixes from 3.19-4.2+ (filesystem corruption, data loss, error handling, RAID 5/6 scrub/replace, block group GC, sysfs, TRIM)
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- net: misc. TCP fixes (TSO, pacing), r8169 support for Byte Queue Limits & xmit_more, fq_codel fixes
- vfs: scalability fixes

