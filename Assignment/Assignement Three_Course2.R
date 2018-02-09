# Assignemnt three - course 2 
outcome <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character") # character to read not available
head (outcome) # many coulmns
ncol (outcome) # coulmns of data
nrow(outcome)  # number of hospitals
outcome[, 11] # this gives the 11th column which is the 30-day death rates from heart attack as character
outcome[, 11] <- as.numeric(outcome[, 11]) # to get rid of the characters >> NA by coercion
hist(outcome[, 11])

# First Function
best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if ( ! state %in% data$State) 
  {
    stop("invalid state")
  }
  else if ( ! (outcome == "Heart Attack" | outcome == "Heart Failure" | outcome == "Pneumonia" 
              |outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia"))
  {
    stop("invalid outcome")
  }
  # else{print("good")}
  ## Return hospital name in that state with lowest 30-day death rate
  if    (outcome == "Heart Attack" | outcome == "heart attack" ) 
  {
    # print ("good heart attack")
    index <- match ( min(as.numeric(data[data[,7] == state,11]), na.rm = TRUE) , as.numeric(data [data[,7] == state,11]) )
    # print (index)
    index <- match (state , data[,7]) + index - 1
  }
  else if (outcome == "Heart Failure"| outcome == "heart failure" ) 
  {
    # print ("good heart failure")
    index <- match ( min(as.numeric(data[data[,7] == state,17]), na.rm = TRUE) , as.numeric(data[data[,7] == state,17]) )
    # print (index)
    index <- match (state , data[,7]) + index - 1
  }
  else if (outcome == "Pneumonia"    | outcome == "pneumonia"    ) 
  {
    # print ("good pneumonia")
    index <- match ( min(as.numeric(data[data[,7] == state,23]), na.rm = TRUE) , as.numeric(data [data[,7] == state,23]) )
    # print (index)
    index <- match (state , data[,7]) + index - 1
  }
  # print (index)
  data [index,2]
}


rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check that state and outcome are valid
  if ( ! state %in% data$State) 
  {
    stop("invalid state")
  }
  else if ( ! (outcome == "Heart Attack" | outcome == "Heart Failure" | outcome == "Pneumonia" 
               |outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia"))
  {
    stop("invalid outcome")
  }
  ## Return hospital name in that state with the given rank 30-day death rate
  # get range of the state
  index <- match (state, data$State)
  index2 <- index
  while (data [index2,7] == state) {
    index2 <- index2 + 1
  }
  index2 <- index2 - 1
  new <- character()
  # get a vector of the needed data only
  if    (outcome == "Heart Attack" | outcome == "heart attack" ) 
  {
      for (i in (index:index2))
      {
        new <- c (new , data[i,11])
      }
  }
  else if (outcome == "Heart Failure"| outcome == "heart failure" ) 
  {
      for (i in (index:index2))
      {
        new <- c (new , data[i,17])
      } 
  }
  else if (outcome == "Pneumonia"    | outcome == "pneumonia"    ) 
  {
      for (i in (index:index2))
      {
        new <- c (new , data[i,23])
      }
  }
  new <- as.numeric(new)
  # sort <- new [!is.na(new)] #Na removed using the function sort
  # start sorting the vector
  new <- sort(new)
  
  # search that value in the state
  # to get the required value
  if (num == "best") {value <- new[1]}
  else if (num == "worst") {value <- new [length(new)]}
  if (class(num) == "numeric" & num > length(new)) 
  { 
      NA
  }
  else
  {
      if (num == "best") {value <- new[1]}
      else if (num == "worst") {value <- new [length(new)]}
      else if (as.numeric (num) <= length(new)) {value <- new [as.numeric(num)]}
    
      # to get relative index 
      if    (outcome == "Heart Attack" | outcome == "heart attack" )
      { index <- match ( value, as.numeric(data[data[,7] == state,11]) ) }
      else if (outcome == "Heart Failure"| outcome == "heart failure" ) 
      { index <- match ( value, as.numeric(data[data[,7] == state,17]) ) }
      else if (outcome == "Pneumonia"    | outcome == "pneumonia"   ) 
      { index <- match ( value, as.numeric(data[data[,7] == state,23]) ) }
      # to get the actual index
      index <- match (state , data[,7]) + index - 1
      data [index , 2]
 }

}


rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("rprog%2Fdata%2FProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
  ## Check outcome is valid
  if ( ! (outcome == "Heart Attack" | outcome == "Heart Failure" | outcome == "Pneumonia" 
               |outcome == "heart attack" | outcome == "heart failure" | outcome == "pneumonia"))
  {
      stop("invalid outcome")
  }
  ## For each state, find the hospital of the given rank Return a data frame with the hospital names and the (abbreviated) state name
  # Create data frame with all 54 state and empty hospital name 
  # frame <- data.frame(hospital= character(), state = character() ) 
  hospital <- character()
  state_name <- character()
  counter <- 1
  # print (frame)
  # get range of the state
  for (state in levels( factor(data[,7]))) # here the states are ordered alphapitically unlike how it is in the sheet
  {   
      frame_index <- match (state, levels( factor(data[,7])))
      index <- match (state, data$State)
      index2 <- index
      while (data [index2,7] == state) {
        index2 <- index2 + 1
      }
      index2 <- index2 - 1
      new <- character()
      # print (class(new))
      # get a vector of the needed data only
      if    (outcome == "Heart Attack" | outcome == "heart attack" ) 
      {
        for (i in (index:index2))
        {
          new <- c (new , data[i,11])
        }
      }
      else if (outcome == "Heart Failure"| outcome == "heart failure" ) 
      {
        for (i in (index:index2))
        {
          new <- c (new , data[i,17])
        } 
      }
      else if (outcome == "Pneumonia"    | outcome == "pneumonia"    ) 
      {
        for (i in (index:index2))
        {
          new <- c (new , data[i,23])
        }
      }
      new <- as.numeric(new)
      # print (new)
      # sort <- new [!is.na(new)] #Na removed using the function sort
      # start sorting the vector
      new <- sort(new)
      # print (new)
      if (class(num) == "numeric" & num > length(new)) 
      { 
        # frame [frame_index,1] <- NA      # wrong way
        # frame [frame_index,2] <- state   # wrong way
        # frame <- rbind(frame,c(NA,state))
        hospital <- c (hospital , NA)
        state_name <- c (state_name,state) 
      }
      else
      {
        if (num == "best") {value <- new[1]}
        else if (num == "worst") {value <- new [length(new)]}
        else if (as.numeric (num) <= length(new)) {value <- new [as.numeric(num)]}
        
        # to get relative index 
        if      (outcome == "Heart Attack" | outcome == "heart attack" )
        { index <- match ( value, as.numeric(data[data[,7] == state,11]) ) }
        else if (outcome == "Heart Failure"| outcome == "heart failure" ) 
        { index <- match ( value, as.numeric(data[data[,7] == state,17]) ) }
        else if (outcome == "Pneumonia"    | outcome == "pneumonia"   ) 
        { index <- match ( value, as.numeric(data[data[,7] == state,23]) ) }
        # to get the actual index
        index <- match (state , data[,7]) + index - 1
        # print (index)
        # frame [frame_index,1] <- data [index , 2]  # wrong way
        # frame [frame_index,2] <- state             # wrong way
        # frame <- rbind(frame,c(data [index , 2],state))
        hospital <- c (hospital , data[index,2])
        state_name <- c (state_name,state) 
      }
  }
  frame <- data.frame(hospital= hospital, state = state_name ) 
  frame
}

