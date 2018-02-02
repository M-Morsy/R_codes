add2 <- function(x,y) {
  x + y
}

above <- function(x, n = 10){
  # n is a default parameter ir a default value 
  use <- (x > n)
  x [use]
}

columnmean <- function (x, removeNA = TRUE) {
	nc <- ncol (x)
	means <- numeric (nc)
	for ( i in 1:nc)
	{
		means[i] <- mean (x[,i] , na.rm = removeNA)
	}
	means
}
# you can send functions as arguements to another function
# formals () & args (): return the arguments of one function & its default values

# Argument Matching: when using a function and name the arguments, you don't need to match
# Argument Matching: when using a function and don't name the arguments, you need to match
# Argument Matching: If you name all arguments & don't name the last one, it's recognized automatically
#--------------------------------------------------------------------------------------#
# Lazy Evaluation: the arguments are evaluated only if needed >> you get errors late
f <- function(a,b)
{
  print (a)
  print (b)
}
# here if you send only a, which is a <- 1:20, the error shows after printing a:
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
# Error in print(b) : argument "b" is missing, with no default
#--------------------------------------------------------------------------------------#
# Generic Functions: Extending a function using arguement ... 
myplot <- function(x,y, type = "1", ...)
{
  plot (x,y,type = type, ...)
}
#--------------------------------------------------------------------------------------#
# Unlimited number of parameters:
# args (paste)
# function (..., sep = " ", collapse = NULL) 
# NULL
# You must use the name of the argument after the "..." explictly & full
# paste(x,y, se = ":")
#--------------------------------------------------------------------------------------#
# Function Symbol binding
# Each symbol (function name) is binded to a value "some code"
# R uses search ()
# R searches objects in your global workspace first to find the value
# If the value isn't there, it gets to the namespaces of the other packages 
# the order of packages is imortant in the search list
#--------------------------------------------------------------------------------------#
# Scoping Rule "different from S"
# R uses statical / lexcial scope
# How a value is bound to a free variable (not defined in the fn. header) in R functions
# f <- function (x,y) { x^2 + y / z} z: free variable
# The values of the free variables are searched for in the environment in which the fn. was defined
# Everything in R is: Symbol & Value
# Env. has children
# Function + Env. = Closure 
# Search: Current Env. >> Parent Env. (next on the search list) >> >> Top Level Env. (Usually Golbal Env.) >> Empty Env. >> not found (throw error)

#Example:
# > f (x,y) [1]   3.727273   4.333333   9.955414  18.727273  25.333333  36.955414  51.727273  64.333333
#           [9]  81.955414 102.727273 121.333333 144.955414 171.727273 196.333333 225.955414 258.727273
#           [17] 289.333333 324.955414 363.727273 400.333333
#           Warning message:
#           In x^2 + y/z :
#           longer object length is not a multiple of shorter object length
#> z <- 2
#> f (x,y)  [1]   2.5   5.5  10.5  17.5  26.5  37.5  50.5  65.5  82.5 101.5 122.5 145.5 170.5 197.5
#           [15] 226.5 257.5 290.5 325.5 362.5 401.5
#--------------------------------------------------------------------------------------#
# Lexcial Scoping:
# YOU can define a whole function inside another function
# one function can return a matrix, vector .. etc OR ANOTHER FUNCTION
make.power <- function(n){
  pow <- function(x){
    x^n # here n is a free variable >> search in the cuurent env. to find the n :D  
  }
    
  pow
}
# try after that:
# cube <- make.power(3)       # cube
# square <- make.power (2)    # square
# cube (3)
# square (3)
# ls (environment(cube))          [1] "n"   "pow"
# ls (environment(square))          [1] "n"   "pow"
# get ("n", environment(cube))    [1] 3
# get ("n", environment(square))  [1] 2
#--------------------------------------------------------------------------------------#
# lexical vs dynamic
# lexical: the value of free variable is looked up from the environment the function was DEFINED at
# dynamic: the value of free variable is looked up from the environment the function was CALLED at

# Example
# y <- 10 
# f <- function (x) { y<- 2
#    y^2 + g (x)
# }
# g <- function (x) {x*y}

#lexcical scoping : y = 10 in the function g
#dynamic  scoping : y =  2 in the function g
#--------------------------------------------------------------------------------------#
# Consequences
# Everthing must be stored in memory 
# Every function must carry a pointer to its defining Env.
