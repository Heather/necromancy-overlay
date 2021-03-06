# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit flag-o-matic eutils subversion

ESVN_REPO_URI="svn://svn.berlios.de/chrasis/Engine/libchrasis/trunk"
ESVN_PROJECT="libchrasis"

IUSE=""
DESCRIPTION="Library for Chinese Character Recognition As-Is"
HOMEPAGE="http://chrasis.berlios.de"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64"
DEPEND="dev-cpp/libxmlpp
	>=dev-db/sqlite-3
	!dev-libs/libchrasis
	virtual/libc"
RDEPEND="${DEPEND}"

src_compile() {
	glib-gettextize -f
	./autogen.sh
	econf || die "./configure failed"
	emake -j1 || die "make failed"
}

src_install() {
	make install DESTDIR=${D} || die "install failed"
} 
