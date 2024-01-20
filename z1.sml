fun iinsert(sorted_list, value, comparator, discriminator) =
  if null sorted_list then [value]
  else
    let
      val hd = hd sorted_list
      val tl = tl sorted_list
    in
      if comparator(value, hd) then
        value :: sorted_list
      else
        hd :: iinsert(tl, value, comparator, discriminator)
    end;

fun iinsort(lst, comparator, discriminator) =
  if null lst then []
  else
    let
      val hd = hd lst
      val tl = tl lst
    in
      iinsert(iinsort(tl, comparator, discriminator), hd, comparator, discriminator)
    end;

(* Comparator functions *)
fun op_less(a, b) = a < b;
fun op_less_equal(a, b) = a <= b;
fun op_greater(a, b) = a > b;
fun op_greater_equal(a, b) = a >= b;

(* Discriminator functions *)
fun nd(_, _) = false;
fun op_equal(a, b) = a = b;

(* Example usage *)
val sorted_list = iinsort([5, 2, 9, 1, 5], op_less, nd);
(*List.app (fn x => print (Int.toString x ^ " ")) sorted_list;*)

