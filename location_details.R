# Get Foodie Index, Nightlife Index, Top Cuisines
# and Best rated restaurants in a given location
#
#' @param use_key API key, string
#' @param entity_id location id obtained from locations api, integer
#' @param entity_type location type obtained from locations api, string
#' @return list
#' @references \url{https://developers.zomato.com/documentation#!/location/location_details}


library(httr)


location_details_api<-function(use_key,entity_id,entity_type){
  url <- modify_url("https://developers.zomato.com",
                    path = "/api/v2.1/location_details")

  resp <- GET(url,add_headers(Accept="application/json",
                              "user-key"=use_key),
              query=list(entity_id=entity_id,entity_type=entity_type))

  return(zomato_parser(resp))
}
