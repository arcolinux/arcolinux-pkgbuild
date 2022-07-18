# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=arco-calamares-config-xs-git
_pkgname=arco-calamares-config-xs
_destname="/etc/calamares"
_licensedir="/usr/share/arcolinux/licenses/"
pkgver=22.07
pkgrel=03
pkgdesc="calamares for arcolinux"
arch=('any')
url="https://github.com/arcolinux/${_pkgname}"
license=('GPL3')
makedepends=('git')
depends=()
conflicts=('arco-calamares-config-dev-git' 'arco-calamares-config-git' 'arco-calamares-config-git-git' 'arco-calamares-config-next-git')
provides=("${pkgname}")
options=(!strip !emptydirs)
source=(${_pkgname}::"git+https://github.com/arcolinux/${_pkgname}.git")
sha256sums=('SKIP')
install='readme.install'
package() {
	mkdir -p "${pkgdir}${_licensedir}${_pkgname}"
	mv "${srcdir}/${_pkgname}/"LICENSE "${pkgdir}${_licensedir}${_pkgname}/LICENSE"
	mkdir -p "${pkgdir}${_destname}"
	cp -r "${srcdir}/${_pkgname}/calamares/"* "${pkgdir}${_destname}"
}
