(defun generate-random-list (length max-value)
  (loop repeat length collect (random max-value)))

(defun generate-random-lists (num-lists length max-value)
  (loop repeat num-lists
        collect (generate-random-list length max-value)))

(defun insertion-sort (list)
  (loop for i from 1 below (length list)
        do (let ((key (nth i list))
                 (j (- i 1)))
             (loop while (and (>= j 0) (> (nth j list) key))
                   do (progn
                        (setf (nth (1+ j) list) (nth j list))
                        (decf j)))
             (setf (nth (1+ j) list) key))))

(defun sort-and-time-list (list index)
  (let ((start-time (get-internal-real-time)))
    (insertion-sort list)
    (let ((end-time (get-internal-real-time)))
      (format t "Tempo de execucao para lista ~d: ~d milissegundos~%"
              index (/ (- end-time start-time) 1000.0)))))

(defun sort-and-time-lists (lists)
  (loop for list in lists
        for index from 1
        do (sort-and-time-list list index)))

(defun main ()
  (let* ((num-lists 10)
         (list-length 1000)
         (max-value 100)
         (random-lists (generate-random-lists num-lists list-length max-value)))
    (sort-and-time-lists random-lists)))

(main)
