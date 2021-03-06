\name{singlePermutation}
\alias{singlePermutation}
\title{
    Count Feature Overlap Under a Permutation
}
\description{
    This function performs fast feature overlap 
    count under a circular permutation.
    The input data sets must be preprocessed with 
    \code{\link{shiftrPrepareLeft}} and \code{\link{shiftrPrepareRight}} 
    functions.}
\usage{
singlePermutation(left, right, offset)
}
\arguments{
    \item{left}{
        Feature set prepared with \code{\link{shiftrPrepareLeft}} function.
    }
    \item{right}{
        Feature set prepared with \code{\link{shiftrPrepareRight}} function.
    }
    \item{offset}{
        Offset of one feature set relative to another. 
        See the example below for clarity. \cr
        Zero indicate no offset, i.e. simply count feature overlap.
    }
}

\value{
    Returns count of feature overlap under a circular permutation.
}
\author{
    Andrey A Shabalin \email{andrey.shabalin@gmail.com}
}
\examples{
### Number of features
nf = 1e6

### Generate left and right sets
lset = sample(c(0L,1L), size = nf, replace = TRUE)
rset = sample(c(0L,1L), size = nf, replace = TRUE) | lset

# Prepare binary sets:
lbin = shiftrPrepareLeft(lset)
rbin = shiftrPrepareRight(rset)

### count feature overlap
# R calculations
overlapS = sum(lset & rset)
# Binary calculations
overlapF = singlePermutation(lbin, rbin, 0)

message("Feature overlap: ",
        overlapS, " / ", overlapF,
        " (slow/fast count)")
stopifnot( overlapS == overlapF )


### Count overlap with offset
offset = 2017
# R calculations
overlapOS = sum(lset[ c((offset+1):nf, 1:offset)] & rset)
# Binary calculations
overlapOF = singlePermutation(lbin, rbin, offset)

message("Feature overlap at offset: ",
        overlapOS, " / ", overlapOF,
        " (slow/fast count)")
stopifnot( overlapOS == overlapOF )
}
