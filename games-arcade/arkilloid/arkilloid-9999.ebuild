# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils games git-2

MY_P="arkilloid-${PV}"

DESCRIPTION="Open source Arcanoid-like game"
HOMEPAGE="http://arkilloid.duganet.ru/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=media-libs/libsdl-1.2.13
	>=media-libs/sdl-image-1.2.7
	>=media-libs/sdl-mixer-1.2.8
	>=media-libs/sdl-ttf-2.0
	"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://github.com/duganet/gentoo-overlay.git"
EGIT_PROJECT="arkilloid"
EGIT_HAS_SUBMODULES=1

S="${WORKDIR}/${MY_P}"

src_configure() {
	cmake-utils-src-configure
}

src_install() {
	cmake-utils-src-compile
}
