\name{GetUTCI}
\alias{GetUTCI}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Convert UTCI code to proficency level}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
GetUTCI(textUTCI = "-")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{textUTCI}{
  takes in a string, and converts it into the UTCI proficency level.
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
function (textUTCI = "-")
{
    switch(as.character(textUTCI), `0` = return("Below Proficent"),
        `1` = return("Proficent"), `2` = return("Above Proficent"),
        `-` = return("Unable to calculate"), stop("Invalid UTCI code"))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
