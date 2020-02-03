#' @author Huazi Li <632473742@@qq.com>
#'
#' @description
#' Get Foodie Index, Nightlife Index, Top Cuisines
#' and Best rated restaurants in a given location
#'
#' @param use_key API key, string
#' @param entity_id location id obtained from locations api, integer
#' @param entity_type location type obtained from locations api, string
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/location/location_details}
#'
#' @name
#' get_location_details
#'
#' @title
#' get location details
#'



get_location_details<-function(use_key,entity_id,entity_type){
  url <- httr::modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/location_details")

  resp <- httr::GET(url,httr::add_headers(Accept="application/json",
                              "user-key"=use_key),
              query=list(entity_id=entity_id,entity_type=entity_type))

  return(zomato_parser(resp))
}
