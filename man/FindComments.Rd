\name{FindComments}
\alias{FindComments}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
ACT Comment Codes to Text Equivelents}
\description{
FindComments() adds a column with the text for a given comment code. This is tidyverse \link[magrittr]\%>\% compatable.
}
\usage{
FindComments(.data, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{.data}{
A tbl. This needs to have a vector named $essayComments as produced by \link[ACTmapR]{ReadACT}}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
Allows arguments to be passed down from the function see \link[base]{dots}

}
\value{
An object of the same class as .data
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
temp <-data.frame( essayComments=c("60654211","606542--","5065----", "60------", "--------")
temp <- FindComments(temp)

## The function is currently defined as
function (.data, ...)
{
    .data$commentText <- lapply(.data$essayComments, TranslateComment)
    return(.data)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
