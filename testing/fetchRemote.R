remoteFetch <- function(fname){
  rootName <- 'http://www.mosaic-web.org/go/Redirects/'
  components <- strsplit(fname,'/',fixed=TRUE)
  redirectName <- paste(rootName,components[[1]][1],"/redirectName.txt",sep="")
  
  fp <- file(description=redirectName,open='rt')
  redirectName <- readLines(con=fp,n=1L)
  close(fp)
  
  restOfName <- components[[1]]
  fileName <- paste(redirectName,
                    paste(restOfName[-1],collapse='/'),
                    sep="")
  res <- read.csv(fileName)
  return(res)
}