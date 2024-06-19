(defun peter (m n)
  (cond
    ((= m 0) (+ n 1))
    ((and (> m 0) (= n 0)) (peter (- m 1) 1))
    ((and (> m 0) (> n 0)) (peter (- m 1) (peter m (- n 1))))))

(format t "Resultado = ~d~%" (peter 3 11))  
