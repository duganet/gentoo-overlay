# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools games git

DESCRIPTION="Arkilloid Level Editor"
HOMEPAGE="http://arkilloid.duganet.ru/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	>=media-libs/libsdl-1.2.13
	>=media-libs/sdl-image-1.2.10
	>=media-libs/sdl-ttf-2.0
	"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://git.duganet.ru/arkilloid-leveledit.git"
EGIT_PROJECT="arkilloid"
EGIT_BOOTSTRAP="eautoreconf"
EGIT_HAS_SUBMODULES="true"

src_configure() {
	egamesconf
}

src_install() {
	emake DESTDIR="${D}" install || die "Install failed"
}
