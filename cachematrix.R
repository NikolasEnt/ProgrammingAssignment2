## Create matrix interface, instantiating getters & setters
makeCacheMatrix <- function(X = matrix()) {
  p <- NULL
  set <- function(y) {
    X <<- y
    p <<- NULL
  }
  get <- function() X
  setInversed <- function(solve) p <<- solve
  getInversed <- function() p
  list(set = set, get = get, setInversed = setInversed, getInversed = getInversed)
}

##cacheSolve computes the inverse of the matrix, which was created by the makeCacheMatrix function.
cacheSolve <- function(X, ...) {
  p <- x$getInversed()
  if(!is.null(p)) {
    message("getting cached data")
    return(p)
  }
  data <- X$get()
  p <- solve(data, ...)
  X$setInversed(p)
  p
}
