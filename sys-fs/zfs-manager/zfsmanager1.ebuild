# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=2

inherit eutils

DESCRIPTION="ZFS Manager is a menu driven utility for managing ZFS Filesystems "
HOMEPAGE="http://downloads.sourceforge.net/project/zfsmanager/"
#SRC_URI="mirror://sourceforge/${PN}/source/ZFS-Man.py -> zfsmanager.py
SRC_URI="https://raw.githubusercontent.com/necrose99/zfs-manager/master/ZFS-Man.py" -> zfsmanager.py
PYTHON_COMPAT=( python{2_*} )
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""
DEPEND=""
RDEPEND="|| ( sys-fs/zfs sys-fs/zfs-fuse sys-fs/zfs-kmod )"



src_install() {
	echo enalyze analyze -u packages >> /usr/bin/zfsmanager.py
	chmode +x /usr/bin/zfsmanager.py
	ln -s /usr/bin/zfsmanager /usr/bin/zfsmanager.py
	
}

pkg_postinst() {
	elog "Thier is no Official Documentation it is advisable to read  the $HOMEPAGE"
}
