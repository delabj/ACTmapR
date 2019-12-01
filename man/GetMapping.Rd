\name{GetMapping}
\alias{GetMapping}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Fetch Mapping For a Given Year}
\description{
This function gets the mapping from internal data. Used mostly internally, but made into a function for others to use if they need it.}
\usage{
GetMapping(year = "18-19")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{year}{
This takes in a string of a school year in the form of "YY-YY". Currently supported are "18-19" and "19-20"
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (year = "18-19")
{
    switch(as.character(year), `18-19` = return(actMap18_19),
        `19-20` = return(actMap19_20), stop("No Map found, Have you entered the year correctly?"))
    return(NULL)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
