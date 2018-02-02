# Simulation and Profiling.R

# STR FUNCTION: 
# used on any object
str (lm)    # details on the function
summary(lm) # error
summary(x)
#      Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
# -1.446000  0.009013  0.468700  0.548200  0.988900  2.803000 
str (x)
# num [1:30] 1.1478 1.3223 -0.9214 -0.2917 -0.0157 ...
s <- split(airquality, airquality$Month)
str (s)
# SIMULATION - CREATING RANDOM NUMBERS
rnorm #normal dist. var
dnorm #prob. Denisty 
pnorm #cumulative Distribution: prob. that the randon var is less than certain value when mean equals a certain value
qnorm #quantile
# They all take mean and standard deviation 
# log option in dnorm to take the log of its output "commonly needed in practice"
# same types of functions exist with other distributions like gamma and poisson .. etc.
# lower tail option for getting the lower tail of the distribution "the part to the left" and can be set to FALSE
# pnorm = phi / qnorm (q) = phi(q) / pnorm (q) = phi^-1 (q)

# setting the random numbers generator seeds to get the same results for the number used in set.seed()
set.seed (2)
rnorm(5)
# [1] -0.89691455  0.18484918  1.58784533 -1.13037567 -0.08025176
rnorm(5) # different from the previous but you will have same results each time you call it a second time after seed
#[1]  0.1324203  0.7079547 -0.2396980  1.9844739 -0.1387870
set.seed (2)
rnorm(5) # the same as the first rnorm 
# [1] -0.89691455  0.18484918  1.58784533 -1.13037567 -0.08025176
rnorm(5)
# [1]  0.1324203  0.7079547 -0.2396980  1.9844739 -0.1387870

# GENERATING RANDOM NUMBERS FROM A LINEAR MODEL
set.seed(20)
x6 <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2 * x6 + e
summary(y)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# -6.4080 -1.5400  0.6789  0.6893  2.9300  6.5050 
plot (x6 , y)

# when the predictor "x6 here" is binary / represents a gender for example ... etc.
# use the binomial dist.
set.seed(20)
x6 <- rbinom(100,1,0.5) # n = 1 : number of observaations & p = 0.5 is the vector of probabilities.
e <- rnorm(100,0,2)
summary(y)
plot (x6 , y)

# poisson example
set.seed(20)
x6 <- rnorm(100)
log.mu <- 0.5 + 0.3 * x6 # Given: log u = B0 + B1 x
y  <- rpois(100 , exp(log.mu)) # 100 value - lamda = exp() : vector of non-negative means
summary(y)
plot (x6 , y)

# RANDOM SAMPLING
set.seed(1)
sample (1:10 , 4)               # 4 random samples of the vector
sample (1:10)                   # premutation / reordering
sample (1:10 , replace = TRUE)  # Some values are repeated


