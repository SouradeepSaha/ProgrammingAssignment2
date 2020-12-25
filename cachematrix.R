## Put comments here that give an overall description of what your
## functions do

## Overall, these functions work together to cache the inverse
## of matrix, so that we don't need to calculate them repeatedly.

## Write a short comment describing this function

## This function creates a special matrix object, which 
## returns a list of functions get, set, setinv, getinv
## cached values stored here.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(inv) i <<- inv
  getinv <- function() i
  list(set=set, get=get, setinv=setinv, getinv=getinv)
}


## Write a short comment describing this function

## This function checks if the inverse is already calculated by 
## the getinv() property, and if its already calcuated then 
## returns it. Oterwise, it calculates the inverse and stores
## it in the cahce, and then returns the inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinv()
  if (!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
