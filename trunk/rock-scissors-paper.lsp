(defun play-tests ()
  (vlu-assert-equal 'tie (play 'rock 'rock))
  (vlu-assert-equal 'first-wins (play 'rock 'scissors))
  (vlu-assert-equal 'second-wins (play 'rock 'paper))
  
  (vlu-assert-equal 'second-wins (play 'scissors 'rock))
  (vlu-assert-equal 'tie (play 'scissors 'scissors))
  (vlu-assert-equal 'first-wins (play 'scissors 'paper))
  
  (vlu-assert-equal 'first-wins (play 'paper 'rock))
  (vlu-assert-equal 'second-wins (play 'paper 'scissors))
  (vlu-assert-equal 'tie (play 'paper 'paper))
  )
  
(defun play (pl1 pl2 / play-matrix)
  (setq play-matrix '((rock rock tie) (rock scissors first-wins) (rock paper second-wins)
		     (scissors rock second-wins) (scissors scissors tie) (scissors paper first-wins)
		     (paper rock first-wins) (paper scissors second-wins) (paper paper tie)))
  (play-helper pl1 pl2 play-matrix))

(defun play-helper (pl1 pl2 play-matrix)
  (cond ((null play-matrix) nil)
	((and (equal pl1 (caar play-matrix)) (equal pl2 (cadar play-matrix)))
	 (caddar play-matrix))
	(t (play-helper pl1 pl2 (cdr play-matrix)))))
    
(vlu-remove-tests)
(vlu-add-test 'play-tests)
(vlu-run-tests)