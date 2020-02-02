#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' return information of the chosen restaurant
#' 
#' @param user-key your API key
#' @param res_id id of restaurant
#'
#' @return
#' information about the restaurant
#' 
#' @name 
#' get_restaurant
#' 
#' @title 
#' get information of 84 aspects about the restaurant
#' 
#' @export
#' @examples
#' get_restaurant(api_key="xxxxxx", res_id="xxxxxx")

source("getcategories.R")

# Function of getting information about the restaurant
get_restaurant = function(api_key, res_id) {
  
  # Check the validation of api key
  apikey_check(api_key)
  
  # Check whether res_id is given
  if (is.null(res_id)){
    stop("Please enter the restaurant ID.")
  }
  
  URL <- 'https://developers.zomato.com/api/v2.1/search?'
  params <- list(res_id = res_id)
  
  # Sending request
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/", "restaurant"),
    config = httr::add_headers("user-key" = api_key),
    query = params,
    user_agent("httr")
  )
  
  # Check whether the connection is successful
  apikey_connectioncheck(resp=NULL)
  
  # Convert json into dataframe
  resdata <- jsonlite::fromJSON(content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)
  
  # Change the format of dataframe
  resdata <- unlist(resdata, recursive = FALSE)
  names(resdata) <- gsub("restaurant.|location.|user_rating.", "", names(resdata))
  data
  column <- "apikey|url|link|thumb|featured_image|zomato_events|R.res_id|custom|profile_image"
  names(resdata) <- gsub("restaurant.|location.|user_rating.", "", names(resdata))
  as.data.frame(resdata)[1,]
}