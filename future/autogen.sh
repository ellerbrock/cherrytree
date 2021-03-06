#! /bin/bash -e

# if the argument -M is passed it won't run when Makefile already found
[ "${AutogenOnlyIfNoMakefile}" == "Y" ] && [ -f Makefile ] && exit 0

test -n "$srcdir" || srcdir=`dirname "$0"`
test -n "$srcdir" || srcdir=.

autoreconf --force --install --verbose "$srcdir"
echo "Running intltoolize --copy --force --automake"
intltoolize --copy --force --automake
test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"
