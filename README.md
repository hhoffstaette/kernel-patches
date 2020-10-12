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

**Stable Series: 5.9**

- btrfs: fixes from 5.10+
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_gcc_patch))
- net: BBR v2 ['alpha' from 2019-11-17](https://groups.google.com/forum/?hl=en#!topic/bbr-dev/xLs7_Slx3Qc) + fixes
- projc: [ProjectC 5.9-r0](https://cchalpha.blogspot.com/2020/10/project-c-v59-r0-release.html) CPU scheduler(s)
- xattr: user.pax.* namespace support on tmpfs (thanks to [Gentoo-sources](https://gitweb.gentoo.org/proj/linux-patches.git/))

