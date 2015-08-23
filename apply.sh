#!/bin/bash

# make sure $PWD is a kernel tree
[[ ! -f Kbuild ]] && echo "Error: no kernel tree found in current directory." && exit 1

# find major/minor/micro version of kernel
VERSION=$(grep \^VERSION Makefile | cut -d ' ' -f 3)
[[ -z ${VERSION} ]] && echo "Error: no VERSION found in Makefile." && exit 1
PATCHLEVEL=$(grep \^PATCHLEVEL Makefile | cut -d ' ' -f 3)
[[ -z ${PATCHLEVEL} ]] && echo "Error: no PATCHLEVEL found in Makefile." && exit 1
SUBLEVEL=$(grep \^SUBLEVEL Makefile | cut -d ' ' -f 3)
[[ -z ${SUBLEVEL} ]] && echo "Error: no SUBLEVEL found in Makefile." && exit 1

# check kernel version againt patchset branch
PATCHDIR=$(dirname $0)/${VERSION}.${PATCHLEVEL}.${SUBLEVEL}
[[ ! -d ${PATCHDIR} ]] \
	&& echo "Error: patchset does not match kernel version" ${VERSION}.${PATCHLEVEL}.${SUBLEVEL} \
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
