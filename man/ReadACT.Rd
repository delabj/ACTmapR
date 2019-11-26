\name{ReadACT}
\alias{ReadACT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Read ACT Text File AS Data Frame
}
\description{
Read a fixed width student extract from the ACT disks
}
\usage{
ReadACT(filePath = "fileName", year = "19-20")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{
  The name of the file from which data will be read from.

  This could also be a connection as this is just a wrapper for \link[utils]{read.fwf} that provides the mappings for columns.
}
  \item{year}{
A character that denotes which mapping is to be used. The default is "19-20", Currently supported values are:


    "19-20" : Mapping for files from Augest 2019-September 2020


    "18-19" : Mapping for files from Augest 2018-September 2019
}
}
\details{
The ACT provides schools with disks containing student results. These CDs contain a Fixed Width File (FWF) in a password protected WinZip folder. The FWF is an ASCII line sequental file with carriage return and line feed at the end of a reccord. A reccord is 1050 characters in length (Some Characters are blank). An individual disk can contain upto 700MB or 600,000 reccords.

This acts as a wrapper for fwf that allows for easy reading without creation of the mapping by hand each time.
}
\value{
A \link[base]{data.frame} as produced by \link[utils]{read.fwf} as called within the function. Column widths and names are determined by the mapping, retrieved with \link[ACTmapR]{GetMapping}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Joshua de la Bruere
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{

ff <- tempfile()
ReadACT(ff, mapping="19-20")

## The function is currently defined as
function (filePath = "fileName", year = "19-20")
{
    df <- GetMapping(year)
    if (!is.data.frame(df)) {
        stop("Given Mapping isn't a dataframe. Have you entered the year correctly?")
    }
    read.fwf(file = filePath, widths = df$widthsACT, col.names = df$namesACT)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
