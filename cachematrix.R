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



# This function calculates the inverse of a matrix created with makeCacheMatrix

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
