#' @author Huazi Li <632473742@@qq.com>
#' @description:
#' Get a list of restaurant types in a city. The
#' location/City input can be provided in the following ways:
#' 1. Using Zomato City ID
#' 2. Using coordinates of any location within a city
#'
# List of all restaurants categorized under a particular
# restaurant type can obtained using /Search API with
# Establishment ID and location details as inputs
#'
#' @param use_key API key, string
#' @param city_id id of the city, integer
#' @param lat latitude, double
#' @param lon longitude, double
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/common/establishments}
#' @name
#' get_establishments
#'
#' @title
#' get establishments
#'
#' @export
#' @examples
#' get_establishments("528b6ee8d624e5e3e741f1fbd895b760", "256")


get_establishments<-function(use_key,city_id,lat=NULL,lon=NULL){
  url <- httr::modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/establishments")

  params=list()

  params$city_id=city_id

  if(!is.null(lat)){
    params$lat=lat
  }
  if(!is.null(lon)){
    params$lon=lon
  }

  resp <- httr::GET(url,httr::add_headers(Accept="application/json",
                              "user-key"=use_key),query=params)

  return(zomato_parser(resp))
}

zomato_parser <- function(resp) {
  if (httr::http_type(resp) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }

  parsed <- jsonlite::fromJSON(httr::content(resp, "text"), simplifyVector = FALSE)

  if (httr::http_error(resp)) {
    stop(
      sprintf(
        "Zomato API request failed [%s]\n%s\n<%s>",
        status_code(resp),
        parsed$message,
        resp$url
      ),
      call. = FALSE
    )
  }

  structure(
    list(
      content = parsed,
      response = resp
    ),
    class = "zomato_api"
  )
}
