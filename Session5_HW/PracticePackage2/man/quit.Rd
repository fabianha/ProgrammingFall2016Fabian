\name{quit}
\alias{quit}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
quit(save = "default", status = 0, runLast = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{save}{
%%     ~~Describe \code{save} here~~
}
  \item{status}{
%%     ~~Describe \code{status} here~~
}
  \item{runLast}{
%%     ~~Describe \code{runLast} here~~
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
function (save = "default", status = 0, runLast = TRUE) 
{
    save = switch(save, default = , yes = TRUE, no = FALSE, ask = ask("Save workspace image? [y/n/c]: "), 
        stop("unknown `save` value"))
    if (is.null(save)) 
        return()
    if (runLast) {
        if (!is.null(.GlobalEnv$.Last)) 
            .GlobalEnv$.Last()
        if (!is.null(.GlobalEnv$.Last.sys)) 
            .GlobalEnv$.Last.sys()
    }
    if (save) 
        NULL
    payload <<- c(payload, list(list(source = "ask_exit")))
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
