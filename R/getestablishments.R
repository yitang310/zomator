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
#' list
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
#' get_establishments("528b6ee8d624e5e3e741f1fbd895b760",280)

# function for get a list of restaurant types in a city
get_establishments <- function(key = NULL,city_id = NULL,lat = NULL,lon = NULL){
  #check if given api
  apikey_check(key)

  #check if given city_id
  if (is.null(city_id)){
    stop("Please enter the city ID. You can seach city ID by using get_cities function.")
  }

  url <- httr::modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/establishments")
  params=list("city_id" = city_id,"lat" = lat, "lon" = lon)
  res <- httr::GET(
    url,
    httr::add_headers(Accept="application/json","user-key"=key),query=params)

  return(zomato_parser(res))
}

# function to read json to list
zomato_parser <- function(res) {
  if (httr::http_type(res) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
  parsed <- jsonlite::fromJSON(
    httr::content(res, "text", encoding = 'UTF-8'),
    simplifyVector = FALSE)
  # handle error
  if (httr::http_error(res)) {
    stop(
      sprintf(
        "Zomato API request failed [%s]\n%s\n<%s>",
        status_code(res),
        parsed$message,
        res$url
      ),
      call. = FALSE
    )
  }
  structure(
    list(content = parsed,response = res),
    class = "zomato_api"
  )
}
