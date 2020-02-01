#' Get reviews information about a restaurant on Zomato.
#'
#' @param user_id Required.
#' @param authorization Required. 
#' @return
#' Returns a data frame of results containing restaurant reviews information. 
#' @export

library(httr)

URL <- 'https://developers.zomato.com/api/v2.1/search?'
api_key <- "388fd712b5816621ec4d4dfd6c71bbb2"

get_reviews = function(res_id) {
  
  params <- list(res_id = res_id)
  
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/", "reviews"),
    config = httr::add_headers("user-key" = api_key),
    query = params,
    user_agent("httr")
  )
  
  redata <- jsonlite::fromJSON(content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)
  redata
}