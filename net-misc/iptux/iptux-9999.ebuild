# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="3"
inherit eutils git-2

DESCRIPTION="Iptux is a ipmsg client in linux"
HOMEPAGE="https://github.com/iptux-src/iptux"
EGIT_REPO_URI="git://github.com/iptux-src/iptux.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
	gnome-base/gconf
	>=x11-libs/gtk+-2.22"
RDEPEND="${DEPEND}"

src_configure() {
	econf
}
src_install() {
	emake DESTDIR="${D}" install || die "emake install failed."
}
