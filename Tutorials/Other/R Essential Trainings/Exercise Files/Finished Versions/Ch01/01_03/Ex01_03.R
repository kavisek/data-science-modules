# R Statistics Essential Training
# Ex01_03
# Taking a first look at the interface

8 + 5  # Basic math; press cmd/ctrl-enter
 
1:250  # Prints numbers 1 to 100 across several lines

print("Hello World!")  # Prints "Hello World" in console

# Variables
x <- 1:5  # Put the numbers 1-5 in the variable x
x  # Displays the values in x

y <- c(6, 7, 8, 9, 10)  # Puts the numbers 6-10 in y
y

a <- 1  # Use <- and not =
2 -> a  # Can go other way, but silly
a <- b <- c <- 3  # Multiple assignments

# Vector Math
x
y
x + y  # Adds corresponding elements in x and y
x * 2  # Multiplies each element in x by 2

# "Google's R Style Guide"
browseURL("http://google-styleguide.googlecode.com/svn/trunk/Rguide.xml")

# Clean up
rm(x)  # Remove an object from workspace
rm(a, b)  # Remove more than one
rm(list = ls())  # Clear entire workspace