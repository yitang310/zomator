#' @author Huazi Li <632473742@@qq.com>
#' @description:
#' Search for Zomato locations by keyword. Provide
#' coordinates to get better search results
#'
#' @param use_key API key, string
#' @param location_name suggestion for location name, string
#' @param lat latitude, double
#' @param lon longitude, double
#' @param count max number of results to fetch, integer
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/location/locations}
#'
#' @name
#' get_locations
#'
#' @title
#' get locations
#'

get_locations<-function(use_key,location_name,
                        lat=NULL,lon=NULL,count=NULL){
  url <- httr::modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/locations")

  params=list()

  params$query=location_name

  if(!is.null(lat)){
    params$lat=lat
  }
  if(!is.null(lon)){
    params$lon=lon
  }
  if(!is.null(count)){
    params$count=count
  }

  resp <- httr::GET(url,httr::add_headers(Accept="application/json",
                              "user-key"=use_key),query=params)

  return(zomato_parser(resp))
}
