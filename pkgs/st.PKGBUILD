# Maintainer: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>

pkgname=st-git
_pkgname=st
epoch=1
pkgver=20140511.6dcf735
pkgrel=1
pkgdesc='Simple virtual terminal emulator for X'
url='http://git.suckless.org/st/'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('libxft')
makedepends=('ncurses' 'libxext' 'git' 'ttf-inconsolata')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

_gitroot="https://github.com/pizzooid/st.git"
_gitname="st"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
	cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" clean install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
