# Search for Zomato locations by keyword. Provide
# coordinates to get better search results
#
#' @param use_key API key, string
#' @param location_name suggestion for location name, string
#' @param lat latitude, double
#' @param lon longitude, double
#' @param count max number of results to fetch, integer
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/location/locations}


library(httr)


locations_api<-function(use_key,location_name,
                        lat=NULL,lon=NULL,count=NULL){
  url <- modify_url("https://developers.zomato.com",
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

  resp <- GET(url,add_headers(Accept="application/json",
                              "user-key"=use_key),query=params)

  return(zomato_parser(resp))
}
