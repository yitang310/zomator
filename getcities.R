#Enter parameter values
#user-key: your API key
#q: query by city name
#lat: latitude
#lon: longitude
#city_ids: comma separated city_id values
#count: number of max results to display

#Return the data frame of cities
#id (integer): ID of the city 
#name (string): City name 
#country_id (integer, optional): ID of the country 
#country_name (string, optional): Name of the country 
#is_state (boolean, optional): Whether this location is a state 
#state_id (integer, optional): ID of the state 
#state_name (string, optional): Name of the state 
#state_code (string, optional): Short code for the state

#function for finding the Zomato ID and other details for a city
get_cities <- function(key,q,lat=NULL,lon=NULL,city_ids=NULL,count=NULL){
  source("getcategories.R")
  apikey_check(key)
  if (is.null(q)){
    stop("Please enter the city name.")
  }
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/cities")
  res <- httr::GET(
    url = urlcate, 
    config = httr::add_headers("user-key" = key),
    query = list("q"=q,"lat"=lat,"lon"=lon,"city_ids"=city_ids,"count"=count)
  )
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  if (length(datalist$location_suggestions) == 0){
    stop("Please try another city name.")
  }
  datalist<-datalist$location_suggestions
  return(datalist)
}
