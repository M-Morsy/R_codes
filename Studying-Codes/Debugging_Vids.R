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

# Tools
# Functions: traceback - debug - browser - trace - recover

