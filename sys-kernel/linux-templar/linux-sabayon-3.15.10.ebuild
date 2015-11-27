# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$


inherit versionator

K_SABKERNEL_SELF_TARBALL_NAME="sabayon"
K_REQUIRED_LINUX_FIRMWARE_VER="20131230"
K_SABKERNEL_FORCE_SUBLEVEL="0"
K_SABKERNEL_PATCH_UPSTREAM_TARBALL="1"
K_KERNEL_NEW_VERSIONING="1"

inherit sabayon-kernel

KEYWORDS="~amd64 ~x86"
DESCRIPTION="Official Sabayon Linux Standard kernel image"
RESTRICT="mirror"

DEPEND="${DEPEND}
	sys-apps/v86d"
