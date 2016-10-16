library(rjson)
library(devtools, lib.loc="/usr/lib/R/library")
library(Rfacebook, lib.loc="/usr/lib/R/library")

# load the fb oauth token
load("fb_oauth")

loadLikes <- function(pageNames) {
  query <- "https://graph.facebook.com/v2.8/%s?fields=fan_count"
  
  # init empty dataframe
  pageData = data.frame(name = character(), likes = numeric(), stringsAsFactors = FALSE)
  
  for (name in pageNames){
    response <- callAPI(sprintf(query, name), token=fb_oauth)
    # inefficient but enough for this use case
    pageData <- rbind(pageData, data.frame(name=name, likes=response$fan_count))
  }
  
  pageData
}
