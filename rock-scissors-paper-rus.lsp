(defun play-tests ()
  (vlu-assert-equal '����� (play '������ '������))
  (vlu-assert-equal '������-������� (play '������ '�������))
  (vlu-assert-equal '������-������ (play '������ '������))
  
  (vlu-assert-equal '������-������ (play '������� '������))
  (vlu-assert-equal '����� (play '������� '�������))
  (vlu-assert-equal '������-������� (play '������� '������))
  
  (vlu-assert-equal '������-������� (play '������ '������))
  (vlu-assert-equal '������-������ (play '������ '�������))
  (vlu-assert-equal '����� (play '������ '������))
  )
  
(defun play (pl1 pl2 / play-matrix)
  (setq play-matrix '((������ ������ �����) (������ ������� ������-�������) (������ ������ ������-������)
		     (������� ������ ������-������) (������� ������� �����) (������� ������ ������-�������)
		     (������ ������ ������-�������) (������ ������� ������-������) (������ ������ �����)))
  (play-helper pl1 pl2 play-matrix))

(defun play-helper (pl1 pl2 play-matrix)
  (cond ((null play-matrix) nil)
	((and (equal pl1 (caar play-matrix)) (equal pl2 (cadar play-matrix)))
	 (caddar play-matrix))
	(t (play-helper pl1 pl2 (cdr play-matrix)))))
    
(vlu-remove-tests)
(vlu-add-test 'play-tests)
(vlu-run-tests)