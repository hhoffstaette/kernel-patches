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

**Stable Series: 4.18**

- btrfs: fixes from 4.19+ (correctness, discard, error handling)
- block: fixes from 4.19+ (performance, correctness)
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- loop: observe rotational property of underlying device
- mm: lazy TLB handling (performance)
- net: fixes & improvements from 4.19+ (correctness)
- pds: [PDS-mq 0.98v](https://cchalpha.blogspot.com/2018/08/pds-098v-release.html) CPU scheduler (**disabled** by default)
- xattr: user.pax.* namespace support on tmpfs (thanks to [Gentoo-sources](https://gitweb.gentoo.org/proj/linux-patches.git/))
- xfs: selected fixes from 4.19+ (performance, reliability)

