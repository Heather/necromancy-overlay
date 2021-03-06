# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit autotools eutils git-2

DESCRIPTION="Library to handle different link cables for TI calculators"
HOMEPAGE="http://lpg.ticalc.org/prj_tilp/"
SRC_URI=""

EGIT_REPO_URI="git://github.com/debrouxl/tilibs.git"

MY_PN="libticables"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug doc nls static-libs usb"

RDEPEND="
	dev-libs/glib:2
	usb? ( virtual/libusb:1 )
	nls? ( virtual/libintl )"

DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"

DOCS=( AUTHORS LOGO NEWS README ChangeLog docs/api.txt )

src_prepare() {
	S="${S}/${MY_PN}/trunk/"
	cd ${S}
	eautoreconf
}

src_configure() {
	# if both libusb and libusb10 was set, libusb10 will be used.
	econf \
		--disable-rpath \
		$(use_enable debug logging) \
		$(use_enable usb libusb) \
		$(use_enable usb libusb10) \
		$(use_enable nls) \
		$(use_enable static-libs static)
}

src_install() {
	default
	use doc && dohtml docs/html/*
}

pkg_postinst() {
	elog "Please read README in /usr/share/doc/${PF}"
	elog "if you encounter any problem with a link cable"
}
