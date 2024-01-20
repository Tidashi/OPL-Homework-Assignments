(* Assignment Name: Program 1: Functions and Parameters
   Course and Semester : CS3363-60544 Fall 2023
   Instructor's Name : Richard L. Churchill
   Due Date and Time : Saturday, September 9, 2023, 11:59 PM
   Date and time submitted: TBD
   Your Name and csx user ID : Christopher Tjahjo ctjahjo
*)

(* Defining Comparator Functions *)
fun op<(a,b) = a < b
fun op<=(a,b) = a <= b
fun op>(a,b) = a > b
fun op>=(a,b) = a >= b

(* Discriminator Functions *)
fun nd(a,b) = false
fun op=(a,b) = true

(* Insert Function *)
fun iinsert([], x, _, _) = [x] (* Base case: Insert into an empty list returns a list with the element *)
  | iinsert(sortedList, x, compFunc, discrimFunc) =
    case compFunc(x, hd(sortedList)) of
      true => (* Element should be inserted before the head of the sorted list *)
        if discrimFunc(x, hd(sortedList))
        then sortedList (* If discriminator is true, do not insert duplicate *)
        else x :: sortedList (* Insert the element before the head *)
    | false => hd(sortedList) :: iinsert(tl(sortedList), x, compFunc, discrimFunc); (* Element should belong after the head *)

(* Insertion Sort Function *)
fun iinsort([], _, _) = [] (* Base case: Empty list is already sorted *)
  | iinsort(x::xs, compFunc, discrimFunc) =
    let
      val sortedTail = iinsort(xs, compFunc, discrimFunc) (* Sort the tail of the list *)
    in
      iinsert(sortedTail, x, compFunc, discrimFunc) (* Insert the current element into the sorted tail *)
    end;

(* Test Case *)
val myList = [5, 2, 9, 1, 5, 6];
val sortedList = iinsort(myList, op<, nd);

(* Print the sorted list *)
fun printList([]) = ()
  | printList(x::xs) = (print(Int.toString x); print(" "); printList(xs));

print("Sorted List: ");
printList(sortedList);

