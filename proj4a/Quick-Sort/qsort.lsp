(defun generate-random-list (length max-value)
  (loop repeat length collect (random max-value)))

(defun generate-random-lists (num-lists length max-value)
  (loop repeat num-lists
        collect (generate-random-list length max-value)))

(defun qsort (L)
  (cond
    ((null L) nil)
    (t (append
         (qsort (list< (car L) (cdr L)))  
         (list (car L))                   
         (qsort (list>= (car L) (cdr L))))))) 
         
(defun list< (a b)
  (cond
    ((null b) nil)
    ((< (car b) a) (cons (car b) (list< a (cdr b))))
    (t (list< a (cdr b)))))

(defun list>= (a b)
  (cond
    ((null b) nil)
    ((>= (car b) a) (cons (car b) (list>= a (cdr b))))
    (t (list>= a (cdr b)))))

(defun sort-and-time-lists (lists)
  (loop for list in lists
        for i from 1
        do (let ((start-time (get-internal-real-time)))
             (qsort list)
             (let ((end-time (get-internal-real-time)))
               (format t "Tempo de execucao para a lista ~d: ~d milissegundos~%" 
                       i (/ (- end-time start-time) 1000.0))))))

(defun main ()
  (let ((random-lists (generate-random-lists 10 10000 100)))
    (sort-and-time-lists random-lists)))

(main)
