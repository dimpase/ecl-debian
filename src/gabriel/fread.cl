;; $Header: /project/ecl/cvsroot/ecl/src/gabriel/Attic/fread.cl,v 1.2 2001/08/18 10:55:10 jjgarcia Exp $
;; $Locker:  $

;;; FREAD -- Benchmark to read from a file.
;;; Pronounced "FRED".  Requires the existance of FPRINT.TST which is created
;;; by FPRINT.

(defun fread ()
  (let ((stream (open "/tmp/fprint.tst" :direction :input)))
    (read stream)
    (close stream)))
	    
(defun testfread ()
  (fread))
