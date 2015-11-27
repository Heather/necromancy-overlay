# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="2"

inherit multilib

DESCRIPTION="Utility to change the OpenCL interface being used"
HOMEPAGE="http://www.pentoo.ch/"

SRC_URI="http://dev.pentoo.ch/~grimmlin/distfiles/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-arch/bzip2"
RDEPEND=">=app-admin/eselect-1.2.4"

pkg_postinst() {
	local impl="$(eselect opencl show)"
	if [[ -n "${impl}"  && "${impl}" != '(none)' ]] ; then
		eselect opengl set "${impl}"
	fi
}

src_install() {
	insinto /usr/share/eselect/modules
	doins opencl.eselect || die
}
