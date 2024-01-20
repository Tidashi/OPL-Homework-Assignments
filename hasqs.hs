{-
Assignment Name: Program 2
Course and semeseter : Fall 2023 OPL
Instructor's name: Richard Churchill
Due Date and time: September 23rd 2023 by 11:59 p.m
Date and time submitted: September 22nd 2023 10:00p.m
Your Name and csx user ID: Christopher Tjahjo (ctjahjo)
-}

{-
Method 1
-----------------------------------------------------------------
The follow program is written in haskel. To run the program there are two ways
first you open the haskel interpreter by typing in ghci enter.
Onnce you're in the interpreter run the file by typing in
":load hasqs.hs" that that will then compile the code
you then would need to type "main" enter  to run the main function.

Method 2
----------------------------------------------------------------
You can also run the code not in the GHC interpreter by first compiling it
by typing ghc -o myprogram hasqs.hs
That will then make an executable file to run
you then type ./myprogram to run the file 
-}


{-
The following code uses a quick sort method which picks can be ran in diffrent way depending on wheather you want to start from the start, end or middle.
In this case it uses the start of the list. It chooses the fist element which is labled as x to be the pivot. 
Each value is then checked with the pivot to see if it is larger or smaller than pivor x. The function then recursivly call the quicksort method concatenating them until they're a sorted list. The program then prints a before and after results of the list.Because the values never checked with = the duplicate values are not concatenated with the list.
-}



quicksort :: (Ord sortableList) => [sortableList] -> [sortableList]
--Deafault value in case if the parameter passed through are empty
quicksort [] = []
quicksort (pivot:tail) =
        --checks if elements are smaller than pivot
        let smallSort = quicksort[sortableList | sortableList <- tail, sortableList < pivot]
        --checks if the elements are bigger than pivot
            biggerSorted = quicksort [sortableList | sortableList <- tail, sortableList > pivot]
        in smallSort ++ [pivot] ++ biggerSorted

-- declaring the main function
main :: IO ()
main = do
--declaring an unsorted list
let unsortedList = [1,5,4,3,2,3,4,5,6]
--running the unsortedList through the quick sort then assigning it to a sorted list function
let sortedList = quicksort unsortedList
putStrLn ("Original list: " ++ show unsortedList)
putStrLn ("Sorted List: " ++ show sortedList)

