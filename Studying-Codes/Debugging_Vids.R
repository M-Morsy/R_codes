# Debugging 
# Conditions: message - warning - error
# warning
log (-1)
# Warning message:
# In log(-1) : NaNs produced

#Error
printmessage <- function(x) {
  if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x) # stops auto printing to the console >> used in all print functions
} # like voi funtions but there is no void here

printmessage(1)
printmessage(NA) 
# Error in if (x > 0) print("x is greater than zero") else print("x is less than or equal to zero") : 
# missing value where TRUE/FALSE needed

# message
printmessage2 <- function(x) {
  if(is.na(x))
    print("x is a missing value!")
  else if(x > 0)
    print("x is greater than zero")
  else
    print("x is less than or equal to zero")
  invisible(x)
}
x4 <- log (-1)
printmessage2 (x4)
# [1] "x is a missing value!"
# here the output is tricky. You don't know why x is a missing value
# Maybe something is wrong or not

# How to debug ?
# What was your input? How did you call the function?
# What were you expecting? Output, messages, other results? AND What did you get?
# How does what you get differ from what you were expecting?
# Were your expectations correct in the first place?
# Can you reproduce the problem (exactly)? very important 
# reproducability example: usage of random numbers - web interaction ... etc.)

# Debugging Tools
# Functions: traceback - debug - browser - trace - recover
# Other functions: print - cat

# Examples
mean(not_existing_object)
#Error in mean(not_existing_object) : object 'not_existing_object' not found
traceback()
# 1: mean(not_existing_object)
# here error is from the prvious directly: mean didn't call any function

lm(not_existing_object ~ x)
# Error in eval(expr, envir, enclos) :  object 'not_existing_object' not found
# 7: eval(expr, envir, enclos)
# 6: eval(predvars, data, env)
# 5: model.frame.default(formula = not_existing_object ~ x, drop.unused.levels = TRUE)
# 4: stats::model.frame(formula = not_existing_object ~ x, drop.unused.levels = TRUE)
# 3: eval(expr, envir, enclos)
# 2: eval(mf, parent.frame())
# 1: lm(not_existing_object ~ x)
# here we can see the called functions by lm
# This means you must use traceback directly after the error

debug(lm)
lm( not_existing_object ~ x) # check output yourself
#debugging in: lm(not_existing_object ~ x)
#debug: {
# ret.x <- x
# ret.y <- y
# .........
# z$qr <- NULL
# z }
# Browse[2]> 
# use c to get out of the mode / n to get to the next line till you get an error from that line
# You can debug functions inside the debugger mode "getting into a function" browser[3]

read.csv("nosuchfile")
# Error in file(file, "rt") : cannot open the connection
# In addition: Warning message:
#  In file(file, "rt") :
#  cannot open file 'nosuchfile': No such file or directory

options(error = recover) # for this session of R any error occuring will be under error handeler effect
read.csv("nosuchfile")
# error message printed here
# Enter a frame number, or 0 to exit   
# 1: read.csv("nosuchfile")
# 2: read.table(file = file, header = header, sep = sep, quote = quote, dec = dec, fill
# 3: file(file, "rt")
# Selection: 
# That was the function call stack "same as if you used the trackback function"

# if you select any file it gives you the browser of that function like this:
# Called from: read.table(file = file, header = header, sep = sep, quote = quote, 
#                       dec = dec, fill = fill, comment.char = comment.char, ...)
# Browse[1]> 

