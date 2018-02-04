#R_proframming_week3
library(datasets)
data("iris")                          # 150 rows & 4 coulmns dataset
apply (iris [,1:4], 2 , mean)         # gives the mean of the coulmns: 4   values
apply (iris , 2 , mean)               # Error don't know why
apply (iris [,1:4], 1 , mean)         # gives the mean of the rows   : 150 values
apply (iris [101:150,1:4], 2 , mean)  # gives the mean of the coulmns starting from row 101 to 150: 4   values
library(datasets)
data(mtcars)                  # named data frame
# Methods to calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)
sapply (split(mtcars$mpg,mtcars$cyl), mean ) 
tapply(mtcars$mpg,mtcars$cyl, mean)
with(mtcars,tapply(mpg, cyl, mean))
# Doesn't apply 
apply(mtcars , 2 , mean) # gives the mean of each coulmn
sapply(mtcars$mpg,mtcars$cyl, mean) # Error
lapply (mtcars,mean) # gets the mean of each coulmn (mtcars turns to list of vectors each element is a coulmn)
tapply(mtcars$cyl,mtcars$mpg, mean) # gives cyl according to the mpg "the opposite of what we want"
# What is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars 
m <- tapply(mtcars$hp,mtcars$cyl, mean)
m [3] - m [1]
# what happens when you next call the 'ls' function
debug(ls)
ls