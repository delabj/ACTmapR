#### this reads the fixed width file into R
ReadACT<- function(file = "fileName", year="19-20", blanks=F, scores_Only=T){
  df <- GetMapping(year)
  if(!is.data.frame(df)){
    stop("Given Mapping isn't a dataframe. Have you entered the year correctly?")
  }

  #reads in the file
  temp <- read.fwf(file=file, widths = df$widthsACT, col.names = df$namesACT)
   # checks to see if blank columns are needed
  if(blanks){return(temp)}
  #if not  removes the columns named blank
  temp %>%
    select(-(starts_with("blank")))->temp

#only grab studen names and scores
  if(scores_Only){
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
  switch(year,
         "18-19"= return(actMap18_19),  #sep2018-aug2019
         "19-20"= return(actMap19_20),  #sep2019-aug2020
         stop('No Map found, Have you entered the year correctly?') #error catching
  )
  return(NULL)
}




## this gets the comment for a given code
GetComment <- function(commentCode="--"){

  ## if the code is -- there is no comment
  if(commentCode=="--"){
    return("NA")
  }
  ## if the comment codes need to be between 01 and 99 if this isn't the case something is wrong
  else if(!(as.numeric(commentCode)%in%c(1:99))){
    stop('Invalid Comment Code Code values should be between 01 and 99')
  }
  return(paste0("test",commentCode))
}

## creates a string of comments based on the comment field
TranslateComment <- function(comment="--------"){
  if(comment=="--------"){
    "No Essay Comments"
  }
  else{
    comments <- ""
    for(i in 1:4){
      stop <- i*2
      start <-  stop-1
      comments <- paste(comments, GetComment(substr(comment, start, stop)))
    }
    return(comments)
  }
}

## transform column of comment codes into comments
## THIS IS DPLYR COMPATABLE! :):):)
FindComments <- function(.data, ...){
  .data$commentText <- lapply(.data$essayComments, TranslateComment)
  return(.data)
}

## UTCI
# 0:Below Proficent, 1:Proficent,  2:Above Proficent, -: unable to caluclate
GetUTCI <- function(textUTCI="-"){
  switch(as.character(textUTCI),
         "0" = return("Below Proficent"),
         "1" = return("Proficent"),
         "2" = return("Above Proficent"),
         "-" = return("Unable to calculate"),
         stop('Invalid UTCI code') #error catching
  )
}

#Tranforms the column of  UTCI into text
FindUTCI <- function(.data, ...){
  .data$UTCIText <- lapply(test2$UCTI, GetUTCI)
  return(.data)
}



## PTCRI
# 0:Below Proficent, 1:Proficent,  2:Above Proficent, -: unable to caluclate
GetPTCRI <- function(textPTCRI="-"){
  switch(as.character(textPTCRI),
         "0" = return("= Unlikely to obtain an NCRC"),
         "1" = return("Likely to obtain a Bronze level NCRC"),
         "2" = return("Likely to obtain a Silver level NCRC"),
         "3" = return("Likely to obtain a Gold level NCRC"),
         "4" = return("Likely to obtain a Platinum level NCRC"),
         "-" = return("Unable to calculate"),
         stop('Invalid PTCRI code') #error catching
  )
}

#Tranforms the column of  PTCRI into text
FindPTCRI <- function(.data, ...){
  .data$PTCRIText <- lapply(test2$PTCRI, GetPTCRI)
  return(.data)
}
