#' @author Huazi Li <632473742@@qq.com>
#'
#' @description:
#' Get a list of restaurant types in a city.
#'
#'
#' @param key API key, string
#' @param city_id id of the city, integer
#' @param lat latitude, double
#' @param lon longitude, double
#'
#' @return
#' dataframe
#' establishment_id (integer) ID of the establishment type
#' establishment_name (string) Name of the establishment type
#'
#' @name
#' get_establishments
#'
#' @title
#' get establishments
#'
#' @export
#' @examples
#' get_establishments(key = "testkey",city_id = 280)

# function for get a list of restaurant types in a city
get_establishments <- function(key = NULL,city_id = NULL,lat = NULL,lon = NULL){
  #check if given api
  apikey_check(key)
  #check if the testkey
  if (key=="testkey"){
    testword<-"This is a testkey."
    return(testword)
  }
  #check if given city_id
  if (is.null(city_id)){
    stop("Please enter the city ID. You can seach city ID by using get_cities function.")
  }

  url <- httr::modify_url("https://developers.zomato.com",
                          path = "/api/v2.1/establishments")
  params <- list("city_id" = city_id,"lat" = lat, "lon" = lon)
  res <- httr::GET(
    url,
    httr::add_headers(Accept="application/json","user-key"=key),query=params)
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  #check if return results
  if (length(datalist$establishments) == 0){
    stop("Please try another city ID.")
  }
  return(datalist$establishments)
}
