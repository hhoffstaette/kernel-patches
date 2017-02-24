kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a release:

- check out the branch you want, or use master for the current stable version
- run the `../kernel-patches/apply.sh` script when in the kernel directory
- build as usual

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**LTS series: 4.9**

- bfq: [BFQ v8r8](http://algogroup.unimore.it/people/paolo/disk_sched/)
- block: [throttled background writeback v8](http://marc.info/?l=linux-block&m=147751514819997) (*disabled* by default)
- btrfs: fixes from 4.10+ (cleanups, correctness, error handling etc.)
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- loop: observe rotational property of underlying device
- mm: memory management fixes from 4.10+
- muqss: [MuQSS v152](http://ck-hack.blogspot.de/2017/02/linux-410-ck1-muqss-version-0152-for.html) (*disabled* by default)
- sched: CFS cpu scheduler fixes from 4.10+
- xattr: user.pax.* namespace support on tmpfs (thanks to [Gentoo-sources](https://gitweb.gentoo.org/proj/linux-patches.git/))
- xfs: selected fixes from 4.10+

