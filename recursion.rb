require "byebug"

#Range 

# Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, 
# exclusive. For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# Write both a recursive and iterative version of sum of an array.

def range(start, last)
    
    return [] if  last < start    # base case 

   range(start, last - 1) + [last]

end 

p range(5, 10)


# Exponentiation
# Write two versions of exponent that use two different recursions:

# # this is math, not Ruby methods.

# # recursion 1
# exp(b, 0) = 1
# exp(b, n) = b * exp(b, n - 1)

# # recursion 2
# exp(b, 0) = 1
# exp(b, 1) = b
# exp(b, n) = exp(b, n / 2) ** 2             [for even n]
# exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
# Note that for recursion 2, you will need to square the results of exp(b, n / 2) and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution.

# Suggestion: Break the methods down into parts. For more information check out the Breaking Methods Into Parts reading in the sidebar.

# Suggestion 2: Try walking through your code with Simple Examples.

# If the n == 256, about how many nested recursive steps will we run in the first case?

# How deep will we need to recurse for the second? Keep in mind that the first reduces the 
# exponent by one for each recursion, while the second reduces it by half.

# In addition to testing your methods by running the code, try the following exercise:

# On paper, write out the value of each variable for every line in the code:

# Write out what happens with base 0 and power 0 as inputs (should be easy). e.g., if you had run exp(0,0).
# Write out what happens for base 0 and power 1. e.g., if you had run exp(0,1).
# Write out what happens for base 1 and power 0.
# Write out what happens for base 1 and power 1.
# Write out what happens for base 1 and power 2.
# Write out what happens for base 2 and power 0.
# Write out what happens for base 2 and power 1.
# Write out what happens for base 2 and power 2.
# Make sure you can trace from the very beginning to the very end in these examples.

# How many examples do you need to walk through to be confident that it works?

def exponention_1(n, exp)
    
    return 1 if exp == 0
        n * exponention_1(n, exp - 1)

    
end 

p exponention_1(5,1)


def exponention_2(n, exp)

    return 1 if exp == 0
    return n if exp == 1
     

    if exp.even?
        (exponention_2(n, (exp / 2))) ** 2  # if n is even 
    else
        n * (exponention_2(n, (exp - 1) / 2) ** 2)  # if n is odd
    end  

end 

p exponention_2(6,2)
p exponention_2(5,3)
p exponention_2(5,4)
p exponention_2(5,1)


# Deep dup
# The #dup method doesn't make a deep copy:

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.dup

# # shouldn't modify robot_parts
# robot_parts_copy[1] << "LEDs"
# # but it does
# robot_parts[1] # => ["capacitors", "resistors", "inductors", "LEDs"]
# When you dup an Array, it creates a new array to hold the elements, but doesn't recursively dup any arrays contained therein. So the dup method creates one new array, but just copies over references to the original interior arrays.

# Sometimes you want a shallow dup and sometimes you want a deep dup. Ruby keeps things simple by giving you shallow dup, and letting you write deep dup yourself.

# Using recursion and the is_a? method, write an Array#deep_dup method that will perform a "deep" duplication of the interior arrays.

# Note: For simplicity's sake, you are only going to ensure the deep duplication of arrays. Don't worry about deep-duping (or regular-duping) other types of mutable objects (like strings, hashes, instances of custom classes, etc.), since this would require that you implement a deep dup method for each of those classes as well.

# It's okay to iterate over array elements using the normal each for this one. :-)

# You should be able to handle "mixed" arrays. For instance: [1, [2], [3, [4]]].

class Array
    def deep_dup
        new_arr = []
        self.each do |ele|
            if !ele.is_a?(Array)
                new_arr << ele
            else
                new_arr << ele.deep_dup
            end
        end
        new_arr
    end

end

array = [1, [2], [3, [4]]]
new_array = array.deep_dup
new_array[2] << 0
p array
p new_array


a_1 = [1,[2]]
new_a_1 = a_1.deep_dup
new_a_1[1] << 4
p a_1
p new_a_1

# Fibonacci
# Write a recursive and an iterative Fibonacci method. The method should take in an integer n and return the first n Fibonacci numbers in an array.

# You shouldn't have to pass any arrays between methods; you should be able to do this just passing a single argument for the number of Fibonacci numbers requested.

def fibs_recur(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2

    prev_fibs = fibs_recur(n-1)
    prev_fibs << prev_fibs[-1] + prev_fibs[-2]
end

p fibs_recur(0)
p fibs_recur(1)
p fibs_recur(2)
p fibs_recur(3)
p fibs_recur(6)
p fibs_recur(10)

def fibs_iter(n)
    return [] if n == 0
    return [0] if n == 1
    return [1, 1] if n == 2

    seq = [0, 1, 1]

    while seq.length < n
        seq << seq[-1] + seq[-2]
    end
    seq
end

p fibs_iter(0)
p fibs_iter(1)
p fibs_iter(2)
p fibs_iter(3)
p fibs_iter(6)
p fibs_iter(10)


def binary_search(array, target)

    return nil if array.empty?

    i = (array.length) / 2

    return i if array[i] == target

    left = array[0...i]
    right = array[i+1..-1]

    if array[i] > target
        binary_search(left, target)
    else
        result = binary_search(right, target)
        return nil if result.nil?
        result += i + 1
    end
end 


array = [1, 2, 3, 4, 5, 6, 9]

p binary_search(array, 2)
p binary_search(array, 4)
p binary_search(array, 8)
p binary_search([], 10)

puts "__________________________"

def merge_sort(arr)
    return arr if arr.length <= 1

    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid..-1]

    left_sorted = merge_sort(left)
    right_sorted = merge_sort(right)

    merge(left_sorted, right_sorted)
end

def merge(left, right)
    result = []

    while !left.empty? && !right.empty?
        # debugger
        if left.first < right.first
            result << left.shift
        else
            result << right.shift
        end
    end

    # if left.empty?
    #     result += right
    # elsif right.empty?
    #     result += left
    # end
    result + left + right
end

arr_1 = [4, 2, 3, 8, 43, 9, 3, 5, 3, 23]
arr_2 = [1, 9, 10, 3, 14, 21, 9, 8, 2]
p merge_sort(arr_1)
p merge_sort(arr_2)