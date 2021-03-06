\name{getOffsets}
\alias{getOffsetsAll}
\alias{getOffsetsRandom}
\alias{getOffsetsUniform}
\alias{getNOffsetsMax}
\title{
    Generate Random or Uniformly Spaced Permutation Offsets
}
\description{
    This functions generate offsets for permutation analysis 
    with \code{\link{shiftrPermBinary}}. 
    Random, uniformly spaced, and complete sets are available via 
    \code{getOffsetsRandom}, \code{getOffsetsUniform}, and 
    \code{getOffsetsAll} functions respectively.
    
    The function \code{getNOffestsMax} calculates 
    the maximum number of permutations (given the margin).
}
\usage{
getOffsetsRandom(n, npermute, margin = 0.05)
getOffsetsUniform(n, npermute, margin = 0.05)
getOffsetsAll(n, margin)

getNOffsetsMax(n, margin)
}
\arguments{
    \item{n}{
        Number of features in the permuted sets.
    }
    \item{npermute}{
        The number of offsets to be generated (number of permutations).
    }
    \item{margin}{
        Offsets by less than \code{margin*n} or 
        more than \code{(1-margin)*n} are not generated.
    }
}
\value{
    Returns a set of permutation offsets for use in 
    \code{\link{shiftrPermBinary}} function. \cr
    The set of offsets is 
    \enumerate{
        \item random for \code{getOffsetsRandom}, 
        \item uniformly spaced for \code{getOffsetsUniform}, or 
        \item all possible for \code{getOffsetsAll}.
    }
    The function \code{getNOffestsMax} returns the 
    maximum number of permutations (given the margin).
}
\author{
    Andrey A Shabalin \email{andrey.shabalin@gmail.com}
}
\examples{
### Number of features, permutations, and margin
n = 100
npermute = 20
margin = 0.1

### Maximum number of permutations 
# Should be 81 (from 10 to 90)
getNOffsetsMax(n, margin)

### Random offsets
getOffsetsRandom(n, npermute, margin)

### Uniformly spaced offsets
getOffsetsUniform(n, npermute, margin)

### All possible offsets
getOffsetsAll(n, margin)
}
