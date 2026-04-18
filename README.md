kernel-patches
==============

Custom Linux kernel patches for vanilla upstream Linux, organized by major
version similar to Greg KH's -stable queue.

These patches were born out of an initial need to apply "just a few fixes"
to [btrfs](https://btrfs.readthedocs.io/), and eventually grew to include both
additional features and performance/scalability improvements to the entire kernel.

To apply over a release:

- check out the branch for the kernel you want (see `git branch -l`)
- run the `kernel-patches/apply.sh` script when in the kernel directory
  (do *not* use `git am`, it will very likely mess up the output!)
- build as usual

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Codeberg. Older release series will only see sporadic updates, if any.

**Series: 7.0**

- btrfs: fixes from 7.1+
- net: fixes from 7.1+
- net: add [TCP ROCCET](https://arxiv.org/abs/2510.25281) congestion control
- prjc: [ProjectC](https://gitlab.com/alfredchen/projectc) CPU scheduler

