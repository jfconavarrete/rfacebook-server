# load the pages data
pageNames <- strsplit(commandArgs(trailingOnly=TRUE), ",")
pageLikes <- loadLikes(pageNames)

#* @get /page
page <- function(){
  pageLikes
}

