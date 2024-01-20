=begin
Assignment name: Programming Assignment 4
Course and Semester: Fall CS3363
Due date and time: 10/21/2023 11:59pm
Name and csxID: Christopher Tjahjo ctjahjo (A20310935)

You can compile the script my doing ruby <script name> so in this insance
you do "ruby myqsort.rb"

The Following code uses a quick sort algorithim in ruby

=end

#sorting function declaration
def myqsort(listOfNumbers)
  #if there are 1 or less elements in the list
  return listOfNumbers if listOfNumbers.length <= 1
  
  pivot = listOfNumbers.delete_at(rand(listOfNumbers.length))
  left, right = listOfNumbers.partition { |element| element < pivot }

  return *myqsort(left), pivot, *myqsort(right)

end

#method call
unsortedList = [1,3,4,6,7,123,12,23]
sortedList = myqsort(unsortedList)

puts "Sorted List: #{sortedList.join(', ')}"
