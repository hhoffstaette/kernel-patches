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
  (do *not* use `git am`, it will very likely mess up the output!)
- build as usual

All patches of a series must be applied, as some have interdependencies
(e.g. between the btrfs/vfs/block layers).

A patch series should apply cleanly to the *latest* version of the respective -stable
release on [kernel.org](https://www.kernel.org/); if it does not then **please** file
a bug here on Github. Older release series will only see sporadic updates, if any.

**Series: 6.8**

- btrfs: fixes from 6.9+
- block: fixes & performance improvements from 6.9+ ([timestamps](https://lore.kernel.org/linux-block/20240126213827.2757115-1-axboe@kernel.dk/), [schedulers](https://lore.kernel.org/linux-block/20240123174021.1967461-1-axboe@kernel.dk/))
- kconfig: support for `-march=native` ([repository](https://github.com/graysky2/kernel_compiler_patch))
- ~~prjc: [ProjectC](https://gitlab.com/alfredchen/projectc) CPU scheduler~~ removed due to never-ending problems. :(
- sched: fixes for EEVDF from 6.9+
- xfs: fixes from 6.9+

