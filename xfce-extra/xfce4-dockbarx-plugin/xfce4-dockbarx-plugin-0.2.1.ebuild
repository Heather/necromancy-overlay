# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit xfconf  python vala waf-utils

PYTHON_DEPEND="2:2.7"
RESTRICT_PYTHON_ABIS="3.*"

DESCRIPTION="Embed DockbarX in the xfce4-panel"
HOMEPAGE="http://xfce-look.org/content/show.php/xfce4-dockbarx-plugin+%2B+Mouse+DBX+Theme?content=157865"
SRC_URI="http://tiz.qc.to/pub/xfce4-dockbarx-plugin-${PV}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND="dev-lang/vala
	x11-misc/dockbarx
	xfce-base/xfce4-panel
"
RDEPEND="${DEPEND}"

src_prepare() {
	vala_src_prepare
}

src_configure() {
	cd "${WORKDIR}"/"${PN}-${PV}"
	waf-utils_src_configure
	waf-utils_src_compile
}

src_install() {
	waf-utils_src_install
}
