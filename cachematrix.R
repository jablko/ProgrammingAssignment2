## Invert a matrix and cache the result, to demonstrate the power of
## environments in R!

## Construct a special "matrix" object that can cache its own inverse.

makeCacheMatrix <- function (x = matrix()) {
  inverse <- NULL
  list(get = function () x,
       getinverse = function () inverse,
       setinverse = function (inverse) inverse <<- inverse)
}


## Compute the inverse of a special "matrix" returned by
## makeCacheMatrix(), above. Only calculate the result once -- stow the
## result for next time and just return the cached value, if available.

cacheSolve <- function (x) {
  inverse <- x$getinverse()
  if (is.null(inverse)) {
    x$setinverse(solve(x$get()))
  } else {
    inverse
  }
}
