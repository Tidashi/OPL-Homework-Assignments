#|
p3.lisp
course: CS-3363 OPL Fall 2023
Assignment: Programming Assignment 3
Author: Christopher Tjahjo
Due: 10/7/2023 11:59pm
Submitted: 10/7/2023 10:00pm

How to build
-----------------------
to run this file please open the open promopt and login to the csx server
Once logged on please type clisp <fileName> in this instance you would type
clisp p3.lisp

This will run the and call the methods in the code
The function call provided are a valid list and an empty list

To test additional cases please add elements to the exiting source code where it calls for the fun lins at the bottom
In addtion you can add a print statement by doing
(print (lins '(<lstOfNumbers>)))
The list of number number need to be seperated by spaces

|#


(defun lins (lst)
  (labels ((insert-sort (lst)
	;;checks for empty list
        (if (endp lst)
            '()
	    ;call insert function if not empty
            (insert (car lst) (insert-sort (cdr lst))))))
	;declartion of insert function
	(defun insert (elem lst) 
	   (if (endp lst)
               (list elem)
                ;if the element is less than the first element in the list 
		(if (< elem (car lst))
                   (cons elem lst)
                   (cons (car lst) (insert elem (cdr lst))))))

            ;return statement
	    (insert-sort lst)))
;;; Call the insert-sort function
(print (lins '(3 2 4 2)))
(print (lins '()))
