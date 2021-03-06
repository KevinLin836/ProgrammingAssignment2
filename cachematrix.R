# This function stores the matrix and the inverse, if it is already solved
# for. It contains a list of functions to set and obtain the matrix/inverse.

makeCacheMatrix <- function(x = matrix()) {
    inverse <- NULL 
    set <- function(y) {
        x <<- y
        inverse <<- NULL 
    }
    get <- function() x
    setinverse <- function(matrix_inverse) inverse <<- matrix_inverse
    getinverse <- function() inverse
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


# This function computes the inverse of the 'matrix' generated by the
# function above if an inverse had not yet been computed. If an inverse
# was already obtained, the function will pull it from the cache. 

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    inverse <- x$getinverse()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    data <- x$get()
    inverse <- solve(data)
    x$setinverse(inverse)
    inverse
}
