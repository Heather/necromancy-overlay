# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

DEADBEEF_GUI="yes"

inherit deadbeef-plugins git-r3

DESCRIPTION="DeaDBeeF musical spectrum plugin"
HOMEPAGE="https://github.com/cboxdoerfer/ddb_musical_spectrum"
EGIT_REPO_URI="https://github.com/cboxdoerfer/ddb_musical_spectrum.git"

LICENSE="GPL-2"
KEYWORDS=""

RDEPEND+=" sci-libs/fftw:3.0="

DEPEND="${RDEPEND}"

src_prepare() {
	epatch "${FILESDIR}/${PN}-cflags.patch"
}

src_compile() {
	use gtk2 && emake gtk2
	use gtk3 && emake gtk3
}
