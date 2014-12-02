kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to btrfs, and eventually grew to include both additional features and
performance/scalability improvements to the entire kernel.

**List of patches for 3.14.x**

- bfq: BFQ v7r6 ([Budget Fair Queueing I/O scheduler](http://algogroup.unimore.it/people/paolo/disk_sched/))
- bfs: BFS v454 + SMT-nice patch ([Con Colivas' low-latency CPU scheduler](http://ck-hack.blogspot.com/))
- btrfs: >430 patches from 3.15..3.18+ to address corruption, stability, performance and also most new capabilities, e.g. `O_TMPFILE`, `renameat2` and automatic GC of empty blockgroups. \o/
- ext4: corruption fixes, `renameat2`
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- locking: cancellable/optimistic spinning MCS / queued rwlocks ([patch](http://bit.ly/Xq41R6), [article]( http://lwn.net/Articles/590243/))
- mm: proper `msync()`, per-thread VMA caching (in .21, [article](http://lwn.net/Articles/589475/)), reduced use of atomics in page handling & thrash detection-based file cache sizing
- net: updates for Realtek NICs (e.g. r8169 support for Byte Queue Limits, RTL8168EP support), reduced use of atomics in fq qdisc
- timekeeping: improved accuracy with `CONFIG_NO_HZ`
- vfs: `renameat2` ([article](http://lwn.net/Articles/592952/)) & other updates from 3.16/17/18

To apply over a -stable release simply run `patch -s -p1 < <patch-dir/*>` when
in the kernel directory, and build as usual.

Most patches are generic for all architectures except for the MCS locking
series, which unfortunately only applies to x86/x86_64 thanks to unrelated
Kconfig changes. See the patch log for more information (should be easy to
fix, I just can't test it).

The currently **required minimum** -stable release is **3.14.25**; unless
otherwise noted any later 3.14-stable release should work as well.
