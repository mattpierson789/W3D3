

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


def 


