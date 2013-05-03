;;; Counting DNA Nucleotides
;;; http://rosalind.info/problems/dna/
;;;
;;; A string is simply an ordered collection of symbols selected from some
;;; alphabet and formed into a word; the length of a string is the number of
;;; symbols that it contains.
;;;
;;; An example of a length 21 DNA string (whose alphabet contains the symbols
;;; 'A', 'C', 'G', and 'T') is "ATGCTTCAGAAAGGTCTTACG."
;;;
;;; Given: A DNA string s of length at most 1000 nt.
;;;
;;; Return: Four integers (separated by spaces) counting the respective number
;;; of times that the symbols 'A', 'C', 'G', and 'T' occur in s.
;;;
;;; Sample Dataset
;;;
;;; AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC
;;;
;;; Sample Output
;;;
;;; 20 12 17 21

(defun inchash (key hash)
  (if (null (gethash key hash))
      (setf (gethash key hash) 1)
      (incf (gethash key hash))))

(defun count-dna (input)
  (assert (stringp input))
  (let ((counts (make-hash-table)))
    (map 'list
	 (lambda (letter)
	   (inchash letter counts))
	 input)
    (mapcar (lambda (letter)
	      (gethash letter counts))
	    (map 'list 'identity "ACGT"))))

(assert
 (equalp
  (count-dna "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")
  '(20 12 17 21)))