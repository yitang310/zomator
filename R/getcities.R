#' @author
#' Yi Tang <tangyi2014@@gmail.com>
#'
#' @description
#' search for Zomato ID and other details for a city
#'
#' @param key your API key
#' @param q query by city name
#' @param lat latitude
#' @param lon longitude
#' @param city_ids comma separated city_id values
#' @param count number of max results to display
#'
#' @return
#' id (integer) ID of the city
#' name (string) City name
#' country_id (integer, optional) ID of the country
#' country_name (string, optional) Name of the country
#' is_state (boolean, optional) Whether this location is a state
#' state_id (integer, optional) ID of the state
#' state_name (string, optional) Name of the state
#' state_code (string, optional) Short code for the state
#'
#' @name
#' get_cities
#'
#' @title
#' get cities ID
#'
#' @export
#' @examples
#' get_cities(key="00b8630a1745b3dda0d7ec926bba5c04",q="van")

#function for finding the Zomato ID and other details for a city
get_cities <- function(key=NULL,q=NULL,lat=NULL,lon=NULL,city_ids=NULL,count=NULL){
  #check if given api
  apikey_check(key)
  #check if given city name
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
  #check if the api key can used to connect to zomato
  apikey_connectioncheck(res)
  #read json into dataframe
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  #check if return results
  if (length(datalist$location_suggestions) == 0){
    stop("Please try another city name.")
  }
  #only want the dataframe
  datalist<-datalist$location_suggestions
  return(datalist)
}
