# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit eutils gnome2 versionator

MATE_BRANCH="$(get_version_component_range 1-2)"

SRC_URI="http://pub.mate-desktop.org/releases/${MATE_BRANCH}/${P}.tar.xz"
DESCRIPTION="MATE Settings Daemon"
HOMEPAGE="http://mate-desktop.org"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="X debug libnotify policykit pulseaudio smartcard gtk3"

RDEPEND=">=dev-libs/dbus-glib-0.74:0
	>=dev-libs/glib-2.17.3:2
	>=mate-base/libmatekbd-1.9:0[gtk3?]
	>=mate-base/mate-desktop-1.9:0[gtk3?]
	media-libs/fontconfig:1.0
	>=gnome-base/dconf-0.13.4:0
	x11-libs/cairo:0
	!gtk3? ( x11-libs/gdk-pixbuf:2
	>=x11-libs/gtk+-2.24:2
	pulseaudio? (
		media-libs/libcanberra:0[gtk]
		>=media-sound/pulseaudio-0.9.15:0
        )
)
        gtk3? ( x11-libs/gtk+:3
        pulseaudio? (
           media-libs/libcanberra[gtk3]
           >=media-sound/pulseaudio-0.9.15:0
        )
)
        x11-libs/libX11:0
	x11-libs/libXi:0
	x11-libs/libXext:0
	x11-libs/libXxf86misc:0
	>=x11-libs/libxklavier-5:0
	virtual/libintl:0
	libnotify? ( >=x11-libs/libnotify-0.7:0 )
	policykit? (
		>=dev-libs/dbus-glib-0.71:0
		>=sys-apps/dbus-1.1.2:0
		>=sys-auth/polkit-0.97:0
	)
	!pulseaudio? (
		>=media-libs/gstreamer-0.10.1.2:0.10
		>=media-libs/gst-plugins-base-0.10.1.2:0.10
	)
	smartcard? ( >=dev-libs/nss-3.11.2:0 )"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.37.1:0
	sys-devel/gettext:0
	virtual/pkgconfig:0
	x11-proto/inputproto:0
	x11-proto/xproto:0"

src_prepare() {
	gnome2_src_prepare
}

src_configure() {
        local myconf
        use gtk3 && myconf="${myconf} --with-gtk=3.0"
        use !gtk3 && myconf="${myconf} --with-gtk=2.0"
	gnome2_src_configure \
		$(use_with libnotify) \
		$(use_enable debug) \
		$(use_enable policykit polkit) \
		$(use_enable pulseaudio pulse) \
		$(use_enable !pulseaudio gstreamer) \
		$(use_enable smartcard smartcard-support) \
		$(use_with X x) \
                ${myconf}
}

DOCS="AUTHORS NEWS ChangeLog"
