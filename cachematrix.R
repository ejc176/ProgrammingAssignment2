## Below is a pair of functions that
## cache the inverse of a matrix.

## This function creates a special "matrix" object
## that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() return(x);
        set_inverse <- function(inverse) m <<- inverse;
        get_inverse <- function() return(m)
        return(list(set=set, get=get, set_inverse=set_inverse, get_inverse=get_inverse))
}

## This function computes the inverse of the special
## "matrix" returned by `makeCacheMatrix` above. If the inverse has
## already been calculated (and the matrix has not changed), then the
## `cachesolve` will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        m <- x$get_inverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$set_inverse(m)
        return(m)
}