pollutantmean <- function (directory, pollutant, id = 1:332)
{
  sum <- 0
  mean <- 0
  nrows <- 0
  for(i in id )
  {   id_str <- toString(i)
      # to get id value like written in the files 001 or 077 .. etc.
      
      if ( i < 10 ) 
      {
          id_str <- c ("00",id_str) 
          id_str <- toString(id_str)  
          id_str <- gsub(',', '', id_str)
          id_str <- gsub(' ', '', id_str)
      } else if ( i <100)
      {
          
          id_str <- c ("0",id_str) 
          id_str <- toString(id_str)  
          id_str <- gsub(',', '', id_str)
          id_str <- gsub(' ', '', id_str)
      }
  # get file directory correct
  file <- c (directory , id_str, ".csv")
  file_str <- toString(file)
  file_str <- sub(',', '/', file_str)
  file_str <- gsub(',', '', file_str)
  file_str <- gsub(' ', '', file_str)
  # read the data into data frame
  file_data <- read.csv(file_str)
  # get sum, number of rows with actual values & mean
  sum <- sum + (sum (file_data [[pollutant]], na.rm = TRUE ))
  nrows <- nrows + ( nrow(file_data) - sum (is.na(file_data) [,pollutant]) )
  #print (nrows); #print (sum); #print (file_str);
  }
  #print (nrows); #print (i); #print (sum);
  mean <-  sum / nrows
  mean
}

complete <- function (directory, id = 1:332)
{
    # initate an empty data frame
    complete_dataFrame <-data.frame( id = numeric (),  nobs = numeric())
    counter <- 1
    for(i in id )
    { 
      id_str <- toString(i)
      # to get id value like written in the files 001 or 077 .. etc.
      
      if ( i < 10 ) 
      {
        id_str <- c ("00",id_str) 
        id_str <- toString(id_str)  
        id_str <- gsub(',', '', id_str)
        id_str <- gsub(' ', '', id_str)
      } else if ( i <100)
      {
      
        id_str <- c ("0",id_str) 
        id_str <- toString(id_str) 
        id_str <- gsub(',', '', id_str)
        id_str <- gsub(' ', '', id_str)
      }
      # get file directory correct
      file <- c (directory , id_str, ".csv")
      file_str <- toString(file)
      file_str <- sub(',', '/', file_str)
      file_str <- gsub(',', '', file_str)
      file_str <- gsub(' ', '', file_str)
      # read file into data frame
      file_data <- read.csv(file_str)
      # get nobs & concatinate to data frame
      data_file_na <- !is.na.data.frame(file_data)
      nobs <- sum (data_file_na [,2] & data_file_na [,3])
      complete_dataFrame [[counter,1]] <- i
      complete_dataFrame [[counter,2]] <- nobs
      counter <- counter +1
    }
    complete_dataFrame
}

corr <- function(directory, threshold = 0)
{
  # get all ids with the required threshold
  new <- complete("specdata", 1:332 ) 
  new2 <- new [which(new$nobs > threshold) , names(new) %in% c("id")]
  # initialte an empty vector
   vector <- numeric()
  # get corrolation for each element of the found ids and increase it in the vector
  counter <- 1
  for (i in new2)
  {
    id_str <- toString(i)
    # to get id value like written in the files 001 or 077 .. etc.
    
    if ( i < 10 ) 
    {
      id_str <- c ("00",id_str) 
      id_str <- toString(id_str)  
      id_str <- gsub(',', '', id_str)
      id_str <- gsub(' ', '', id_str)
    } else if ( i <100)
    {
      id_str <- c ("0",id_str) 
      id_str <- toString(id_str) 
      id_str <- gsub(',', '', id_str)
      id_str <- gsub(' ', '', id_str)
    }
    # get file directory correct
    file <- c (directory , id_str, ".csv")
    file_str <- toString(file)
    file_str <- sub(',', '/', file_str)
    file_str <- gsub(',', '', file_str)
    file_str <- gsub(' ', '', file_str)
    # read file into data frame
    file_data <- read.csv(file_str)
    #print (file_data[1,4])
    vector [counter] <- cor (file_data[[2]] , file_data[[3]], use = "complete.obs")
    counter <- counter +1
  }
  vector
}
