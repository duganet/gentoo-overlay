# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils
DESCRIPTION="NBMA Next Hop Resolution Protocol daemon"
HOMEPAGE="http://sourceforge.net/projects/opennhrp"
SRC_URI="mirror://sourceforge/opennhrp/${P}.tar.bz2"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE=""
DEPEND="net-dns/c-ares"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i 's:^#ifdef _POSIX_MONOTONIC_CLOCK$:#if defined(_POSIX_MONOTONIC_CLOCK) || defined(CLOCK_MONOTONIC):' nhrp/sysdep_poll.c
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	newinitd "${FILESDIR}"/opennhrp.init opennhrp
	newconfd "${FILESDIR}"/opennhrp.confd opennhrp
}

