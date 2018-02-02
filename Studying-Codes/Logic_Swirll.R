
TRUE == TRUE # [1] TRUE
(FALSE == TRUE) == FALSE # [1] TRUE
6 == 7 # [1] FALSE
6 < 7 # TRUE 
10 <= 10 # [1] TRUE
# logical operations take into consideration the signs
-6 > -7 # [1] TRUE
5 !=  7  # [1] TRUE
! 5 == 7 # [1] TRUE
TRUE & c(TRUE, FALSE, FALSE)  # [1]  TRUE FALSE FALSE
TRUE && c(TRUE, FALSE, FALSE) # [2] TRUE # evaluated with the first element in the vector
TRUE | c(TRUE, FALSE, FALSE)  # [1] TRUE TRUE TRUE
TRUE || c(TRUE, FALSE, FALSE) # [1] TRUE
5 > 8 || 6 != 8 && 4 > 3.9    # [1] TRUE
isTRUE(6 >4)
identical('twins', 'twins')
identical('hello', 'Hello')   #[1] FALSE
identical(5 > 4, 3 < 3.1)     #[1] TRUE
xor ( 5==6 , !FALSE)          #[1] TRUE
# xor returns TRUE when the two argueements are not equal (FALSE,TRUE) (TRUE,FALSE)
xor(identical(xor, 'xor'), 7 == 7.0) #[1] TRUE

ints <- sample(10)
ints                          # [1]  8  1  3  2  7 10  4  6  9  5

which(c(TRUE, FALSE, TRUE))
which(ints > 7)               # [1] 1 6 9
any(ints < 0)                 # [1] FALSE
all (ints > 10)               # [1] TRUE

