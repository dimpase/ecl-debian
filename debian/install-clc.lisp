;;; -*- Mode: LISP; Package: CL-USER -*-
;;;
;;; Copyright (C) Peter Van Eynde 2001-2005 and Kevin Rosenberg 2002-2003
;;;
;;; License: LGPL v2
;;;
(in-package "COMMON-LISP-USER")

(require :cmp)
(format t "~%Saving to new-ecl...")
(load "/usr/share/common-lisp/source/common-lisp-controller/common-lisp-controller.lisp"
      :verbose nil
      :print nil)
(let ((files (common-lisp-controller:compile-common-lisp-controller-v5 "ecl")))
   (format t "~%~%compile done, files: ~S~%" files)
  (system:gc t)
  (c:build-program
   "/usr/bin/ecl"
   :lisp-files 
   files
   :epilogue-code '(progn
		    (funcall (intern (symbol-name :init-common-lisp-controller-v5)
				     (find-package :common-lisp-controller))
			     "ecl")
		    (when (probe-file #p"/etc/lisp.config")
		      (load #p"/etc/lisp.config"))
		    (system:top-level))))
(quit)
