kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a -stable release simply run `patch -s -p1 < ../kernel-patches/version/*` when in the kernel directory, and build as usual.

A patch series should apply cleanly to the *latest* version of the respective -stable release on [kernel.org](https://www.kernel.org/); if it does not then **please** file a bug here on Github. Older release series will only see sporadic updates, if any. Backport requests for specific patches/features from Linus' mainline tree are also welcome!

**Current release: >=3.18.3**

- bfq: BFQ v7r7 ([Budget Fair Queueing I/O scheduler](http://algogroup.unimore.it/people/paolo/disk_sched/))
- bfs: BFS v460+ ([Con Colivas' low-latency CPU scheduler](http://ck-hack.blogspot.com/))
- btrfs: fixes from 3.19+ for filesystem corruption, error handling, RAID 5/6 scrub/replace, block group GC, improved TRIM
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- net: TSO improvements


**Previous release: >=3.14.29**

- bfq: BFQ v7r7 ([Budget Fair Queueing I/O scheduler](http://algogroup.unimore.it/people/paolo/disk_sched/))
- bfs: BFS v454 + SMT-nice patch ([Con Colivas' low-latency CPU scheduler](http://ck-hack.blogspot.com/))
- btrfs: >490 patches from 3.15-3.19+ to address corruption, stability, performance and all new capabilities: `O_TMPFILE`, `renameat2`, RAID 5/6 scrub/replace, TRIM and automatic GC of empty blockgroups. \o/
- ext4: corruption fixes, `renameat2`
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- locking: cancellable/optimistic spinning MCS / queued rwlocks ([patch](http://bit.ly/Xq41R6), [article]( http://lwn.net/Articles/590243/))
- mm: proper `msync()`, per-thread VMA caching (in .21, [article](http://lwn.net/Articles/589475/)), reduced use of atomics in page handling & thrash detection-based file cache sizing
- net: updates for Realtek NICs (e.g. r8169 support for Byte Queue Limits, RTL8168EP support), reduced use of atomics in fq qdisc
- timekeeping: improved accuracy with `CONFIG_NO_HZ`
- vfs: `renameat2` ([article](http://lwn.net/Articles/592952/)) & other updates from 3.16/17/18

