#!/bin/sh

if [ ! -f /usr/share/common-lisp/source/common-lisp-controller/common-lisp-controller.lisp ] ; then
  cat <<EOF
$0: cannot find the common-lisp-controller source.
EOF
  exit 0
fi

build_error()
{
    echo "Build failure $1"
    exit 1
}

case $1 in
    install-clc)
	    echo $0 loading and dumping clc.
	    ( cd /tmp
	      /usr/lib/ecl/ecl-original -load /usr/lib/ecl/install-clc.lisp )
	    ;;
    remove-clc)
	    echo $0 removing clc-enabled image
	    cp /usr/lib/ecl/ecl-original /usr/bin/ecl
	    ;;
    *)
	    echo $0 unkown command $1
	    echo known commands: install-clc and remove-clc
	    exit 1
	    ;;
esac

exit 0
