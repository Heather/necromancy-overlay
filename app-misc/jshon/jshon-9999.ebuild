# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

inherit git-2

DESCRIPTION="Jshon is a JSON parser designed for maximum convenience within the shell"
HOMEPAGE="http://kmkeen.com/jshon/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/keenerd/jshon.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
dev-libs/jansson"

src_install() {
	dobin ${PN}
	doman ${PN}.1
}
