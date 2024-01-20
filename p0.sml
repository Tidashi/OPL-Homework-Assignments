(* Assignment Name: Program 0: Proof of Access
   Course and Semester : CS3363-60544 Fall 2023
   Instructor's Name : Richard L. Churchill
   Due Date and Time : Saturday, August 26, 2023, 11:59 PM
   Date and time submitted: TBD
   Your Name and csx user ID : Christopher Tjahjo ctjahjo
*)
   
(* The following program contains a recursive function named epoly which accepts a list of real nuimbers and a single real value
 The list contains the coefficients of a polynomial the second parameter is run the summation  from 0 to x
 the program itself was from Using-csx.pptx in canvas *)

(*To run the code connect to the csx server then type sml<enter>. Once you're in the enviroment run the code using 
  using "<filename>" for the file name put p0.sml from there it should run the code and tell you what the results are
  You can also run the file by doing just doing sml <filename>  *)


(*function for polynomial formula*)
fun epoly([], x:real) = 0.0
  | epoly(L:real list as h::T, x:real) = h + (x * epoly(T, x));

(* Test Case *)
val result = epoly([6.0, 3.0, 2.8], 5.0)
