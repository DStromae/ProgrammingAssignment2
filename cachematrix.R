
# The function makeCacheMatrix creates a list containing a function to

# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = numeric()) {


        # holds the cached value or NULL if nothing is cached
        # nothing is cached so it sets to NULL
        cache <- NULL

        # matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                cache <<- NULL
                }

        # returns the matrix
        getMatrix <- function() {
                x
                }

        # cache the inverse
        cacheInverse <- function(solve) {
                cache <<- solve
                }

        # get the value in the cache
        getInverse <- function() {
                cache
                }

        

        # return a list. Each named element of the list is a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)

}



# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

cacheSolve <- function(y, ...) {

        # get the cached value
        inverse <- y$getInverse()

        # if a cached value exists it returns it
        if(!is.null(inverse)) {
        return(inverse)

        }

        # caclulate the inverse and store it 
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)

        

        # return the inverse
        inverse

}
