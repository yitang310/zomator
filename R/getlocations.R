#' @author Huazi Li <632473742@@qq.com>
#' @description:
#' Search for Zomato locations by keyword. Provide
#' coordinates to get better search results
#'
#' @param key API key, string
#' @param query suggestion for location name, string
#' @param lat latitude, double
#' @param lon longitude, double
#' @param count max number of results to fetch, integer
#'
#' @return
#'
#' @name
#' get_locations
#'
#' @title
#' get locations
#'
#' @export
#' @examples
#' get_locations("528b6ee8d624e5e3e741f1fbd895b760","van")
#'

#function to search for Zomato locations by keyword
get_locations<-function(key,query,
                        lat=NULL,lon=NULL,count=NULL){
  #check if given api
  apikey_check(key)
  if (is.null(query)){
    stop("Please enter the city name.")
  }

  url <- httr::modify_url("https://developers.zomato.com",
                          path = "/api/v2.1/locations")

  params=list("query"=query,"lat" = lat,"lon" = lon,"count"= count)
  res <- httr::GET(url,httr::add_headers(Accept="application/json",
                                         "user-key"=key),query=params)

  #check if the api key can used to connect to zomato
  apikey_connectioncheck(res)
  #read json into dataframe
  resdata <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  #check if return results
  if (length(resdata$location_suggestions) == 0){
    stop("Please try another city name.")
  }
  return(resdata$location_suggestions)
}


