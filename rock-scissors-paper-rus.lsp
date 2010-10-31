(defun play-tests ()
  (vlu-assert-equal 'ничья (play 'камень 'камень))
  (vlu-assert-equal 'первый-выиграл (play 'камень 'ножницы))
  (vlu-assert-equal 'второй-выграл (play 'камень 'бумага))
  
  (vlu-assert-equal 'второй-выграл (play 'ножницы 'камень))
  (vlu-assert-equal 'ничья (play 'ножницы 'ножницы))
  (vlu-assert-equal 'первый-выиграл (play 'ножницы 'бумага))
  
  (vlu-assert-equal 'первый-выиграл (play 'бумага 'камень))
  (vlu-assert-equal 'второй-выграл (play 'бумага 'ножницы))
  (vlu-assert-equal 'ничья (play 'бумага 'бумага))
  )
  
(defun play (pl1 pl2 / play-matrix)
  (setq play-matrix '((камень камень ничья) (камень ножницы первый-выиграл) (камень бумага второй-выграл)
		     (ножницы камень второй-выграл) (ножницы ножницы ничья) (ножницы бумага первый-выиграл)
		     (бумага камень первый-выиграл) (бумага ножницы второй-выграл) (бумага бумага ничья)))
  (play-helper pl1 pl2 play-matrix))

(defun play-helper (pl1 pl2 play-matrix)
  (cond ((null play-matrix) nil)
	((and (equal pl1 (caar play-matrix)) (equal pl2 (cadar play-matrix)))
	 (caddar play-matrix))
	(t (play-helper pl1 pl2 (cdr play-matrix)))))
    
(vlu-remove-tests)
(vlu-add-test 'play-tests)
(vlu-run-tests)