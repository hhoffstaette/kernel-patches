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

**LTS series: 4.4**

- bfs: [BFS v467](http://ck-hack.blogspot.de/2015/12/bfs-467-linux-43-ck3.html) (*not* enabled by default)
- block: [latency-sensitive writeback](http://marc.info/?l=linux-block&m=146168622002151&w=2), CFQ & deadline scheduler fixes
- btrfs: fixes up to 4.8+ (block allocator, cleanups, data loss, performance, recovery etc.)
- cpufreq: CPU frequency/power management fixes (mostly intel_pstate)
- ext4: fixes up to 4.7+ (corruption, crash consistency, performance, [mbcache2](https://lwn.net/Articles/668718/))
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- loop: observe rotational property of underlying device
- net: TCP performance, r8169 support for Byte Queue Limits & xmit_more, fq_codel fixes
- sched: core/fair scheduler fixes, [schedstats as runtime tunable](http://article.gmane.org/gmane.linux.kernel/2148311)
- time: misc. ntp/rtc/timekeeping fixes
- vfs: performance improvements
- wq: workqueue fixes
- xattr: user.pax.* namespace support on tmpfs (thanks to [Gentoo-sources](https://gitweb.gentoo.org/proj/linux-patches.git/))
- xfs: fixes up to 4.7+ (correctness, performance)

