(defun generate-random-list (length max-value)
  "Gera uma lista de comprimento LENGTH com números aleatórios entre 0 e MAX-VALUE."
  (loop repeat length collect (random max-value)))

(defun generate-random-lists (num-lists length max-value)
  "Gera NUM-LISTS listas aleatórias, cada uma com comprimento LENGTH e valores até MAX-VALUE."
  (loop repeat num-lists
        collect (generate-random-list length max-value)))

(defun bubble-sort (lst)
  "Ordena a lista LST usando o algoritmo Bubble Sort."
  (let ((array (coerce lst 'vector)))
    (loop for i from 0 below (length array) do
      (loop for j from 0 below (- (length array) 1) do
        (when (> (aref array j) (aref array (1+ j)))
          (rotatef (aref array j) (aref array (1+ j))))))
    (coerce array 'list)))

(defun sort-and-time-lists (lists)
  "Ordena LISTS usando bubble-sort e mede o tempo de execução para cada lista individualmente."
  (loop for lst in lists
        for idx from 1 do
          (let ((start-time (get-internal-real-time)))
            (bubble-sort lst)
            (let ((end-time (get-internal-real-time)))
              (format t "Tempo de execucao para a lista ~d: ~d milissegundos~%" 
                      idx (/ (- end-time start-time) 1000.0))))))
                      
(defun main ()
  "Função principal para gerar listas aleatórias, ordená-las e medir o tempo de execução."
  (let ((random-lists (generate-random-lists 10 1000 100)))  ; 10 listas, comprimento 1000, valores até 100
    (sort-and-time-lists random-lists)))

(main)  ; Chamada da função principal para executar o programa
