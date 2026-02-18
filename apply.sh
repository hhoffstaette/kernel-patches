#!/bin/bash

# help
if [[ $1 == "-h" ]] || [[ $1 == "--help" ]] ; then
	echo
	echo "Usage: " $0 "[OPTION]"
	echo
	echo "Options are:"
	echo "  -f, --force : do not verify kernel release against patch series tag"
	echo "  -h, --help  : this message"
	echo
	exit 0
fi

# make sure $PWD is a kernel tree
[[ ! -f Kbuild ]] && echo "Error: no kernel tree found in current directory." && exit 1

# find major/minor/micro version of kernel
VERSION=$(grep \^VERSION Makefile | cut -d ' ' -f 3)
[[ -z ${VERSION} ]] && echo "Error: no VERSION found in Makefile." && exit 1
PATCHLEVEL=$(grep \^PATCHLEVEL Makefile | cut -d ' ' -f 3)
[[ -z ${PATCHLEVEL} ]] && echo "Error: no PATCHLEVEL found in Makefile." && exit 1
SUBLEVEL=$(grep \^SUBLEVEL Makefile | cut -d ' ' -f 3)
[[ -z ${SUBLEVEL} ]] && echo "Error: no SUBLEVEL found in Makefile." && exit 1

# check kernel series againt patchset branch
PATCHDIR=$(dirname $0)/${VERSION}.${PATCHLEVEL}
[[ ! -d ${PATCHDIR} ]] \
	&& echo "Error: patchset does not match kernel series" ${VERSION}.${PATCHLEVEL} \
	&& exit 1

# check release version against patch series tag
if [[ $1 != "-f" ]] && [[ $1 != "--force" ]] ; then
	RELEASE=$(git -C $(dirname $0) describe --exact-match --tags)
	[[ ${RELEASE} != ${VERSION}.${PATCHLEVEL}.${SUBLEVEL} ]] \
		&& echo "Error: patchset ${RELEASE} does not match kernel release" ${VERSION}.${PATCHLEVEL}.${SUBLEVEL} \
		&& exit 1
fi

apply() {
	[[ -z ${APPLYOPTS} ]] && echo && echo "Error: APPLYOPTS not set?!" && exit 1
	for p in ${PATCHES}
	do
		# first a test run
		patch --dry-run ${APPLYOPTS} < ${p}
		if [[ $? == "0" ]] ; then
			# looks good: now apply
			patch ${APPLYOPTS} < ${p}
		else
			echo && echo "Error: could not apply ${p}" && exit 1
		fi
	done
}

echo -n "Applying patches from: "${PATCHDIR}".."

# use consistent options for patch
PATCHOPTS="-F0 -p1 -s"

# first find & apply any reverts
PATCHES=$(find ${PATCHDIR} -type f -name "revert-*.patch" | sort)
APPLYOPTS="${PATCHOPTS} --reverse"
apply

# now find & apply the actual patches
PATCHES=$(find ${PATCHDIR} -type f -not -name "revert-*.patch" | sort)
APPLYOPTS=${PATCHOPTS}
apply

echo "done! :)"
