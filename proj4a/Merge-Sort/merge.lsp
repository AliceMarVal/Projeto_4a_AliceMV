(defun generate-random-list (length max-value)
  (loop repeat length collect (random max-value)))

(defun generate-random-lists (num-lists length max-value)
  (loop repeat num-lists
        collect (generate-random-list length max-value)))

(defun merge-sort (list)
  (if (small list)
      list
      (let* ((left (left-half list))
             (right (right-half list)))
        (merge-lists (merge-sort left) (merge-sort right)))))

(defun small (list)
  (or (null list) (null (cdr list))))

(defun right-half (list)
  (last list (ceiling (/ (length list) 2))))

(defun left-half (list)
  (ldiff list (right-half list)))

(defun merge-lists (list1 list2)
  (merge 'list list1 list2 #'<))

(defun sort-and-time-list (list index)
  (let ((start-time (get-internal-real-time)))
    (merge-sort list)
    (let ((end-time (get-internal-real-time)))
      (format t "Tempo de execucao para lista ~d: ~d milissegundos~%"
              index (/ (- end-time start-time) 1000.0)))))

(defun sort-and-time-lists (lists)
  (loop for list in lists
        for index from 1
        do (sort-and-time-list list index)))

(defun main ()
  (let* ((num-lists 10)
         (list-length 100000)
         (max-value 100)
         (random-lists (generate-random-lists num-lists list-length max-value)))
    (sort-and-time-lists random-lists)))

(main)
