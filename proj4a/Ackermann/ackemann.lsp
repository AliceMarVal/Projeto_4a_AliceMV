(defun ackermann (m n p)
  (cond
    ((= p 0) (+ m n))
    ((= n 0)
     (cond
       ((= p 1) 0)
       ((= p 2) 1)
       (t m)))
    (t (ackermann m (ackermann m (- n 1) p) (- p 1)))))

(defun main ()
  (let ((start-time (get-internal-real-time))
        (result (ackermann 13 5 2))
        (end-time (get-internal-real-time)))
    (format t "Resultado = ~d~%" result)
    (let ((elapsed (/ (- end-time start-time) 1000.0)))
      (format t "Tempo de execucao: ~3f segundos~%" elapsed))))

(main)
