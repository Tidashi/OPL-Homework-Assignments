(* Assignment Name: Program 1: Functions and Parameters
   Course and Semester : CS3363-60544 Fall 2023
   Instructor's Name : Richard L. Churchill
   Due Date and Time : Saturday, September 9, 2023, 11:59 PM
   Date and time submitted: 9/8/2023 - 10:00 PM
   Your Name and csx user ID : Christopher Tjahjo ctjahjo
*)

(*Explanation of assignment*)

(*The Following program is a recursive function that sorts a list depending on the compFunc and discrimFunc.
 if compFunc is op< or op<=, the sorted list will be returned in ascending order. 
 If the compFunc is op>= or op> , the sorted list will be in descending order.
 Similarly if the discrimFunc is op= it will remove duplicates if the discrimFunc is nd then duplicates will be retained
 *) 

(*Explanation of code and why it's done*)

(*For the following recursive code an inserstion sort is used in order to sort the list. I used websites such as geeksforgeeks
 to remind myself what insertion sort is and how it's done. I then created the insort function to take in the user input
 and check if the list was empty. If the list was empty then it would return the empty list if it was then a head and tail
 of a list would be initialized in order to transverse through the list. The insort function will then call the insert function
 using the tail for the iinsert function. The tail and head gets changed constatntly during each function call. Inside the the iinsert
 function i have it check if the list is empty then initialize the new head and tail. The iinsert function first checks if 
 the user want to include duplicates or not if the user does not want to include duplicate it then check if the head and value passed through
 are equal if they are the function is called again and skips the current value other the compFunc is called to check if the head is <,>,<=,>=
 to the head then inserts the value depending whether it comes back true or false. The code does this until the list is sorted.
 for me to complete this assisgment i had to understand sml by using the sml documentmentation provided on canvas*)

(*To run the code connect to the csx server then type sml<enter>. Once you're in the enviroment run the code using 
  "<filename>" for the file name put p1.sml from there it should run the code and tell you what the results are
  You can also run the file by doing just doing sml <filename>  *)

(*insert function*)
fun iinsert(newList: int list, x, compFunc, discrimFunc) =
  if null newList then [x] (*If list was an empty list*)
  
  else
	let
		val hd = hd newList
		val tl = tl newList
	in
		if discrimFunc(x, hd) then (*Checks if the user wants duplicates*)
			iinsert(tl, x, compFunc, discrimFunc)

		else if compFunc(x, hd) then (*Checks values then sorts*)
			x :: newList
		else (*If in correct order*)
 			hd :: iinsert(tl, x, compFunc, discrimFunc)
  	end;


  

(*iinsort function*)
fun iinsort(unsortedList: int list, compFunc, discrimFunc) =                            
   if null unsortedList then [] (*if empty list*)
   else
	(*set the head and tail of the list in order to go through each element*)
	let val hd = hd unsortedList
	    val tl = tl unsortedList
	in
	   iinsert(iinsort(tl, compFunc, discrimFunc), hd, compFunc, discrimFunc)
	end;



(* discrimator Functions *)
fun nd(a,b) = false;  

val sortedList = iinsort([1,2,3,4,5,8,8,9,2], op>, op=);
val sortedList1 = iinsort([1,2,3,4,5,8,8,9,2], op<, nd);
