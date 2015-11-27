# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=4
inherit cmake-utils git-2

DESCRIPTION="avplayer is a p2p video downloader and player"
HOMEPAGE="http://avplayer.avplayer.org"
SRC_URI=""

EGIT_REPO_URI="git://github.com/avplayer/avplayer.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=dev-libs/boost-1.49[threads,static-libs]
		dev-libs/openssl 
		media-libs/libsdl"
RDEPEND="${DEPEND}"
