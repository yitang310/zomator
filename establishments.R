# Get a list of restaurant types in a city. The
# location/City input can be provided in the following ways:
#
#    1. Using Zomato City ID
#    2. Using coordinates of any location within a city
#
# List of all restaurants categorized under a particular
# restaurant type can obtained using /Search API with
# Establishment ID and location details as inputs
#
#' @param use_key API key, string
#' @param city_id id of the city, integer
#' @param lat latitude, double
#' @param lon longitude, double
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/common/establishments}


library(httr)


establishments_api<-function(use_key,city_id,lat=NULL,lon=NULL){
  url <- modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/establishments")

  params=list()

  params$city_id=city_id

  if(!is.null(lat)){
    params$lat=lat
  }
  if(!is.null(lon)){
    params$lon=lon
  }

  resp <- GET(url,add_headers(Accept="application/json",
                              "user-key"=use_key),query=params)

  return(zomato_parser(resp))
}
