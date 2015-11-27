# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit eutils subversion
DESCRIPTION="A full featured system information script"
HOMEPAGE="http://code.google.com/p/inxi/"
ESVN_REPO_URI="http://inxi.googlecode.com/svn"
ESVN_PROJECT="inxi"

LICENSE="GPL-3"
SLOT="current"
KEYWORDS=""

DEPEND="
	x11-apps/mesa-progs
	x11-apps/xrandr
	x11-apps/xdpyinfo
	sys-apps/gawk
	sys-apps/pciutils
"
RDEPEND="${DEPEND}"

src_install() {
	dobin "${WORKDIR}"/"${PN}"-"${PV}"/trunk/inxi
	doman "${WORKDIR}"/"${PN}"-"${PV}"/trunk/inxi.1
        elog "To view a short or full system information."
        elog "inxi -b for short information / inxi -F for full information"
	elog "inxi also provide and verbose show levels '-v1 to -v7'"
        elog "inxi -h for help"
        echo
}
