kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes" to btrfs, and eventually grew to include both additional features and performance/scalability improvements to the entire kernel.

**List of patches for 3.14.x**

- bfs: BFS v454 + SMT-nice patch ([Con Colivas' low-latency CPU scheduler](http://ck-hack.blogspot.com/))
- btrfs: >300 _carefully_ selected patches from 3.15/16/17/18 to address corruption, stability, performance and also a few new capabilities, e.g. `O_TMPFILE` support and automatic GC of empty blockgroups. The kernel workqueues from 3.15 are also merged as more and more patches rely on them, and the notorious "hung task" problem has been fixed.
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- locking: cancellable/optimistic spinning MCS / queued rwlocks ([patch](http://bit.ly/Xq41R6), [article]( http://lwn.net/Articles/590243/))
- mm: proper `msync()`, per-thread VMA caching ([article](http://lwn.net/Articles/589475/)), reduced use of atomics in page handling & fixed prioritisation of swap.
- net: minor updates/fixes for Realtek NICs and r8169 support for Byte Queue Limits.
- timekeeping: improved accuracy with `CONFIG_NO_HZ`
- vfs: `renameat2` ([article](http://lwn.net/Articles/592952/)), dentry list corruption fixes & other updates from 3.16/17

To apply over a -stable release simply run `patch -s -p1 < <patch-dir/*>` when in the kernel directory, and build as usual. You can also pick only what you need, e.g. only `btrfs-*`.

Most patches are generic for all architectures with the exception of the MCS locking series, which unfortunately only applies to x86/x86_64 thanks to unrelated Kconfig changes. See the patch log for more information (trivial to fix, I just can't test it).

The currently **required minimum** -stable release is **3.14.18**; unless otherwise noted any later 3.14-stable release should work as well.
