# lapply
xxx <- list ( 1:5 , rnorm(10) )
lapply (xxx , mean)
xxx <- 1:4 
lapply(xxx, runif)
lapply ( xxx ,runif , min = 0 , max = 10) # ... here is the min & max arguments of runif function
# Anonymous Functions
xxx <- list ( a = matrix(1:4 , 2 , 2) , b = matrix (1:6 , 3 , 2) )
lapply ( xxx, function (mat) mat[,1] )    # extracts the first coulmn in the given matrix
# No name for the function                # This is an anonymous function "defined inside the loop function


# sapply: 
# To simplify lapply output ( matrix / vector )
xxx <- list ( a = matrix(6:12,3, 2) , b = matrix (1:6 , 3 , 2) )
sapply ( xxx, function (mat) mat[,1] ) # returns a matrix 
xxx <- list ( a = 1:4 , b = rnorm(20) , c = rnorm(3) , d = rnorm(7))
sapply (xxx , mean) # returns a vector

# apply:
# To be used with arrays (matrix ffor example) / also used with data frames 
# apply (x , MARGIN , FUN , ...) 
# x: array | MARGIN: Dimensions saved "apply the FUN on it" & collapse the other dimension(s)
xxx <- matrix(rnorm(200), 20 , 10)
apply ( xxx, 1 , mean) # mean applied on the 20 rows    "first dimension"
apply ( xxx, 2 , mean) # mean applied on the 10 coulmns "second dimension"
# Some apply alternatives (more optimized)
rowSums(xxx)  # apply (xxx, 1, sum)
rowMeans(xxx) # apply (xxx, 1, mean)
colSums(xxx)  # apply (xxx, 2, sum)
colMeans(xxx) # apply (xxx, 2, mean)

# good example: quantile function
apply ( xxx , 1 , quantile , .5 )             # returns one vector
apply ( xxx , 1 , quantile , c( 0.25 , 0.75)) # returns matrix :2 (no .parameters) by 20 (no. MARGIN)
# This equ. to returning two vectors in rbind 
# array example
xxx <- array(rnorm(2 * 2 * 10) , c (2 , 2 , 10)) # 10 2x2 matricies
apply ( xxx , c(1,2) , mean) # sums the 10 matricies  gets the mean
rowMeans(xxx , dims = 2)
apply ( xxx , c(1,3) , mean) # mean of 1st & 2nd rows in each matrix
colMeans(xxx , dim = 2)
# mapply:
mapply ( rep , 1:4 , 4:1)
rep (1 , 4)     # [1] 1 1 1 1
rep (1:4 , 4:1) # [1] 1 1 1 1 2 2 2 3 3 4
list (rep (1,4), rep (2,3) , rep(3,2) , rep(4,1))

# Example
noise <- function(n, mean, sd) {rnorm(n, mean, sd)}
noise(5, 1, 2)
noise(1:5, 1:5, 2) # wrong output: [1] -4.2128648 -0.3989266 4.2507057 1.1572738 3.7413584
mapply(noise, 1:5, 1:5, 2) 
# [[1]] [1] 1.037658
# [[2]] [1] 0.7113482 2.7555797
# [[3]] [1] 2.769527 1.643568 4.597882
# [[4]] [1] 4.476741 5.658653 3.962813 1.204284
# [[5]] [1] 4.797123 6.314616 4.969892 6.530432 6.723254

# tapply
# used on vectors to operte the same function on it groups / levels
# 1 vector - many groups "men and women for example - 1 function - many ouput
x <- c(rnorm(10), runif(10), rnorm(10, 1))  # your vector
f <- gl(3, 10)                              # factor "gl used"
tapply(x, f, mean)
tapply(x, f, mean , simplify = FALSE) # returns a vector 

# split 
x <- c(rnorm(10), runif(10), rnorm(10, 1)) # returns a list
f <- gl(3, 10)  
split(x,f,drop = FALSE) # split(x,f,drop = FALSE , ... )
lapply (split (x,f) , mean)
# that was equivliant to tapply , so why split
# more complex data frams, EXAMPLE:
library(datasets)
head (airquality) # dataset display for you
# split the data frame "airquality" into monthly pieces to get mean of some columns in each month
s <- split (airquality , airquality$Month)
# airquiality$Month is a column in dataframe but can be turned to factor variable
# as it has discrete values
lapply(s, function(x) colMeans ( x [, c("Ozone" , "Solar.R" , "Wind")])) # returns a list 
sapply(s, function(x) colMeans ( x [, c("Ozone" , "Solar.R" , "Wind")])) # returns data frame
sapply(s, function(x) colMeans ( x [, c("Ozone" , "Solar.R" , "Wind")], na.rm = TRUE))
# more than one factor 
x3 <- rnorm(10)
print (f1 <- gl(2, 5))
print(f2 <- gl(5, 2))
interaction(f1, f2)                      # not needed
split (x3 , list(f1 , f2))               # list calls interaction internally
str (split (x3 , list(f1 , f2)))         # better display
# NOTE: some levels have 0 values with output >> numeric(0)
split (x3 , list(f1 , f2) , drop = TRUE) # drops the empty levels "results from having 2 factors most of the time"
