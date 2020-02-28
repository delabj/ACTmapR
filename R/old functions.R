############## These have all been depreciated. These two functions are still included to ensure that previous projects don't immediately break.


#### this reads the fixed width file into R
ReadACT<- function(file = "fileName", year="19-20", blanks=F, scores_only=T){
  .Deprecated("read_ACT()",
              package = "ACTmapR",
              msg="To follow better styling principles, this function has been depreciated in favor of read_act()",
              old = "ReadACT()")
  df <- GetMapping(year)
  if(!is.data.frame(df)){
    stop("Given Mapping isn't a dataframe. Have you entered the year correctly?")
  }

  #reads in the file
  temp <- read.fwf(file=file, widths = df$widthsACT, col.names = df$namesACT, comment.char="")
   # checks to see if blank columns are needed
  if(blanks){return(temp)}
  #if not  removes the columns named blank
  temp %>%
    select(-(starts_with("blank")))->temp

#only grab studen names and scores
  if(scores_only){
    temp %>%
      select(lastName, firstName, dateOfBirth, stateID, testDate,
             "composite"= scaleComposite,
             "english" = scaleEnglish,
             "mathmatics"=scaleMath,
             "reading"= scaleReading,
             "science"= scaleScience,
             "writing subscore"= scoreWR
             )->temp
  }

  return(temp)
}


## Flexable Mapping.
GetMapping <- function(year="18-19"){
  .Deprecated("get_mapping()",
              package = "ACTmapR",
              msg="To follow better styling principles, this function has been depreciated in favor of get_mapping()",
              old = "GetMapping()")
  switch(year,
         "18-19"= return(actMap18_19),  #sep2018-aug2019
         "19-20"= return(actMap19_20),  #sep2019-aug2020
         stop('No Map found, Have you entered the year correctly?') #error catching
  )
  return(NULL)
}
