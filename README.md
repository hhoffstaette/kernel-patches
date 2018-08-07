kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.wiki.kernel.org/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a release:

- check out the branch for the kernel you want (see `git branch -l`)
- run the `kernel-patches/apply.sh` script when in the kernel directory
- build as usual

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**NOTE:** This branch will no longer receive updates!
-----------------------------------------------------

**Stable Series: 4.16**

- btrfs: fixes from 4.17+ (correctness, discard, error handling)
- block: fixes from 4.17+ (blk-mq correctness, throttled discard)
- build: support for GCC 8
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- loop: observe rotational property of underlying device
- net: fixes & improvements from 4.17+ ([improved BBR ACK handling](https://groups.google.com/forum/#!topic/bbr-dev/8pgyOyUavvY))
- pds: [PDS-mq 0.98t](http://cchalpha.blogspot.com/2018/07/pds-098t-release.html) CPU scheduler backport for 4.16.x (**disabled** by default)
- realtek: fixes & improvements from 4.17+ (interrupt handling)
- xattr: user.pax.* namespace support on tmpfs (thanks to [Gentoo-sources](https://gitweb.gentoo.org/proj/linux-patches.git/))
- xfs: selected fixes from 4.17+ (cleanups, correctness, performance, reliability)

