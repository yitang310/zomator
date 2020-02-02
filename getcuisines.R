#' @author Yi Tang <tangyi2014@@gmail.com>
#'
#' Enter parameter values
#' @param user-key: your API key
#' @param city_id: id of the city for which collections are needed
#' @param lat: latitude
#' @param lon: longitude

#' @return Zomato Restaurant Collections in a City
#' cuisine_id (integer): ID of the cuisine
#' cuisine_name (string): Name of the cuisine
#'
#' @export
#' @examples
#' get_cuisines(key="xxxxxx")

#function for finding all cuisines of restaurants listed in a city
get_cuisines<-function(key=NULL,city_id=NULL,lat=NULL,lon=NULL){
  source("getcategories.R")
  #check if given api
  apikey_check(key)
  #check if given city_id
  if (is.null(city_id)){
    stop("Please enter the city ID. You can seach city ID by using get_cities function.")
  }
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/cuisines")
  res <- httr::GET(
    url = urlcate,
    config = httr::add_headers("user-key" = key),
    query = list("city_id"=city_id,"lat"=lat,"lon"=lon)
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
  if (length(datalist$cuisines) == 0){
    stop("Please try another city ID.")
  }
  #only want the dataframe
  datalist<-datalist$cuisines
  return(datalist)
}

