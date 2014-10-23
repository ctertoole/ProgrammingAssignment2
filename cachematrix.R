## The following code is for R Programming assignment #2

## The two functions detailed below will create a special vector
## and cache the inverse value of that matrix.
## The steps are as follows:
## 1) makeMatrix     create the matrix
## 2) getMatrix      get the value of a matrix
## 3) cacheInverse   cahce the value of the inverse of the matrix
## 4) getInverse     get the cahced value inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  ## creates the cached value or sets to NULL if nothing to cache
  cache <- NULL
  
  ## the makeMatrix function will create/store the new matrix
  makeMatrix <- function(newValue) {
    x <<- newValue
    cache <<- NULL
  }
  
  ## The getMatrix function returns the newly stored matrix
  getMatrix <- function() {
    x
  }
  
  ## cache the argument listed 
  cacheInverse <- function(solve) {
    cache <<- solve
  }
  
  ## get the cached value 
  getInverse <- function() {
    cache
  }
  
  ## return a list of all the functions
  list(makeMatrix = makeMatrix, getMatrix = getMatrix, 
       cacheInverse = cacheInverse, getInverse = getInverse)
}


## the following function cacheSolve will calculate the inverse of a
## created matrix that used the makeCacheMatrix function

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inverse <- x$getInverse()
  ## if cached value exists return that value
  if(!is.null(inverse)) {
    return(inverse)
  }
  ## if it doesn't exist get the matrix and return its inverse
  matrixdata <- x$getMatrix()
  inverse <- solve(matrixdata)
  x$cacheInverse(inverse)
  
  ## show the results of the inverse
  inverse
  
}

