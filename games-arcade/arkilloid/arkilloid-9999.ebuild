# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools games git

MY_P="arkilloid-${PV}"

DESCRIPTION="Open source Arcanoid-like game"
HOMEPAGE="http://arkilloid.duganet.ru/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="
	>=media-libs/libsdl-1.2.13
	>=media-libs/sdl-image-1.2.7
	>=media-libs/sdl-mixer-1.2.8
	>=media-libs/sdl-ttf-2.0
	"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://git.duganet.ru/arkilloid.git"
EGIT_PROJECT="arkilloid"
EGIT_BOOTSTRAP="eautoreconf"

S="${WORKDIR}/${MY_P}"

src_configure() {
	egamesconf
#	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
