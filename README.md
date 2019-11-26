# actMapping In R


Starting to sketch out a package (in R) of functions that would be useful to those trying to unpack the ACT's fixed width file format for the student records sent to schools. 

The ACT provides schools with disks containing student results. These CDs contain a Fixed Width File (FWF) in a password protected WinZip folder. The FWF is an ASCII line sequental file with carriage return and line feed at the end of a reccord. A reccord is 1050 characters in length (Some Characters are blank). An individual disk can contain upto 700MB or 600,000 reccords.




## Functions

### ReadACT()
This function allows users to read in a fixed width file and provides the mapping based on year. This acts as a wrapper for read.fwf that allows for easy reading without creation of the mapping by hand each time.


The function is called as such:


```R
ReadACT(file="path", mapping="year")

```

This returns a data.frame with columns that have been mapped. Right now the mapping provides 196 columns includeing the blanks. 


### FindComments()
