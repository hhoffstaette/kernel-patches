kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a -stable release:

- check out the branch you want, or use master for the current stable version
- run the `../kernel-patches/apply.sh` script when in the kernel directory
- build as usual

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**NOTE:** This branch will no longer receive updates!
-----------------------------------------------------

**LTS series: 3.14**

- bfs: [BFS v454](http://ck-hack.blogspot.de/2014/08/bfs-453454455456-and-316-ck2.html) + [SMT-nice patches](http://ck-hack.blogspot.de/2014/08/smthyperthreading-nice-and-scheduling.html)
- bfq: [BFQ v7r8](http://algogroup.unimore.it/people/paolo/disk_sched/)
- block: improved CFQ SSD awareness
- btrfs: >800 patches from 3.15-4.2+ to address corruption, stability, performance and all new capabilities: `O_TMPFILE`, `renameat2`, RAID 5/6 scrub/replace, sysfs, TRIM and automatic GC of empty blockgroups. \o/
- ext4: corruption fixes, `renameat2`
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- locking: cancellable/optimistic spinning MCS / queued rwlocks ([patch](http://bit.ly/Xq41R6), [article]( http://lwn.net/Articles/590243/))
- mm: proper `msync()`, per-thread VMA caching (in .21, [article](http://lwn.net/Articles/589475/)), reduced use of atomics in page handling (in .31) & thrash detection-based file cache sizing
- net: updates for Realtek NICs (e.g. r8169 support for Byte Queue Limits, RTL8168EP support), reduced use of atomics in fq qdisc
- timekeeping: improved accuracy with `CONFIG_NO_HZ`
- vfs: `renameat2` ([article](http://lwn.net/Articles/592952/)) & other updates from 3.16-3.18

