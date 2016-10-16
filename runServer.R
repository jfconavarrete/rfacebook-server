library(plumber)

# load our Facebook Repository
source("./fbRepository.R")

# publish the resource
r <- plumb("./pageResource.R")
r$run(port=8000)