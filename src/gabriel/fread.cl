;; $Header: /project/ecl/cvsroot/ecl/src/gabriel/Attic/fread.cl,v 1.4 2001/12/25 16:11:13 jjgarcia Exp $
;; $Locker:  $

;;; FREAD -- Benchmark to read from a file.
;;; Pronounced "FRED".  Requires the existance of FPRINT.TST which is created
;;; by FPRINT.

(in-package "TESTING")

(defun fread ()
  (let ((stream (open "/tmp/fprint.tst" :direction :input)))
    (read stream)
    (close stream)))
	    
(defun testfread ()
  (fread))
