#' @author Huazi Li <632473742@@qq.com>
#'
#' @description
#' Get Foodie and Nightlife Index, list of popular
#' cuisines and nearby restaurants around the given coordinates
#'
#' @param use_key API key, string
#' @param lat latitude, double
#' @param lon longitude, double
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/common/geocode}
#'
#' @name
#' get_geocode
#'
#' @title
#' get geocode
#'
#' @export
#' @examples
#' get_geocode("528b6ee8d624e5e3e741f1fbd895b760","40.742051","-74.004821")


library(httr)

get_geocode<-function(use_key,lat,lon){
  url <- httr::modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/geocode")

  resp <- httr::GET(url,httr::add_headers(Accept="application/json",
                              "user-key"=use_key),
              query=list(lat=lat,lon=lon))

  return(zomato_parser(resp))
}
