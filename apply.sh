#!/bin/bash

# make sure $PWD is a kernel tree
[[ ! -f Makefile ]] && echo "Error: no kernel tree found in current directory." && exit 1

# find major/minor version of kernel
VERSION=$(grep \^VERSION Makefile | cut -d ' ' -f 3)
[[ -z ${VERSION} ]] && echo "Error: no VERSION found in Makefile." && exit 1
PATCHLEVEL=$(grep \^PATCHLEVEL Makefile | cut -d ' ' -f 3)
[[ -z ${PATCHLEVEL} ]] && echo "Error: no PATCHLEVEL found in Makefile." && exit 1

# check kernel version againt patchset branch
PATCHDIR=$(dirname $0)/${VERSION}.${PATCHLEVEL}
[[ ! -d ${PATCHDIR} ]] \
	&& echo "Error: wrong kernel version" ${VERSION}.${PATCHLEVEL} "for current patchset branch." \
	&& exit 1

# find the list of patches to apply
PATCHES=$(\ls -1 ${PATCHDIR}/*.patch)

echo -n "Applying patches from: "${PATCHDIR}".."

for p in ${PATCHES}
do
	patch -p1 -s < ${p} >/dev/null
	[[ $? != "0" ]] && echo && echo "ERROR: could not apply ${p}" && exit 1
done

echo "done! :)"
