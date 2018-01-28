pollutantmean <- function (directory, pollutant, id)
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
          # you must enter directory with / in it
          id_str <- c ("0",id_str) 
          id_str <- toString(id_str)  
          id_str <- gsub(',', '', id_str)
          id_str <- gsub(' ', '', id_str)
      }
  # get file directory correct
  file <- c (directory , id_str, ".csv")
  file_str <- toString(file)
  file_str <- gsub(',', '', file_str)
  file_str <- gsub(' ', '', file_str)
  # read the required data
  file_data <- read.csv(file_str)
  sum <- sum + (sum (file_data [[pollutant]], na.rm = TRUE ))
  nrows <- nrows + nrow(file_data)
  #print (nrows); print (sum); print (file_str);
  }
  #print (i);  print (nrows); print (sum);
  mean <-  sum / nrows
  mean
}

complete <- function (directory, id)
{
    # initate an empty data frame
    complete_dataFrame <-data.frame( id = integer(),  nobs = integer())
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
        # you must enter directory with / in it
        id_str <- c ("0",id_str) 
        id_str <- toString(id_str)  
        id_str <- gsub(',', '', id_str)
        id_str <- gsub(' ', '', id_str)
      }
      # get file directory correct
      file <- c (directory , id_str, ".csv")
      file_str <- toString(file)
      file_str <- gsub(',', '', file_str)
      file_str <- gsub(' ', '', file_str)
      file_data <- read.csv(file_str)
      # get nobs
      data_file_na <- !is.na.data.frame(data_file)
      nobs <- sum (data_file_na [,2] & data_file_na [,3])
      complete_dataFrame [[counter,1]] <- id
      complete_dataFrame [[counter,2]] <- nobs
      counter <- counter +1
    }
    complete_dataFrame
}
