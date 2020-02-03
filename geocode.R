# Get Foodie and Nightlife Index, list of popular
# cuisines and nearby restaurants around the given coordinates
#
#' @param use_key API key, string
#' @param lat latitude, double
#' @param lon longitude, double
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/common/geocode}

library(httr)


geocode_api<-function(use_key,lat,lon){
  url <- modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/geocode")

  resp <- GET(url,add_headers(Accept="application/json",
                              "user-key"=use_key),
              query=list(lat=lat,lon=lon))

  return(zomato_parser(resp))
}
