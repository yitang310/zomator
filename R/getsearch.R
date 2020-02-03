#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' Search for restaurants
#'
#' @param user-key your API key
#' @param query search keyword
#' @param entity_id location id
#' @param entity_type location type city/subzone/zone/landmark/metro/group
#' @param lat latitude
#' @param lon longitude
#' @param radius radius around (lat,lon)
#' @param cuisines list of cuisine id's separated by comma
#' @param establishment_type estblishment id obtained from establishments call
#' @param collection_id collection id obtained from collections call
#' @param sort sort restaurants by cost/rating/real_distance
#' @param order used with 'sort' parameter to define ascending/descending
#'
#' @name
#' get_search
#'
#' @title
#' Search for restaurants
#'
#' @export
#' @examples
#' get_restaurant(api_key="xxxxxx", q="xxxxxx", entity_id="xxxxxx", entity_type="xxxxxx",
#' start="xxxxxx", count="xxxxxx", lat="xxxxxx", lon="xxxxxx",radius="xxxxxx",
#' cuisines="xxxxxx", establishment_type="xxxxxx", collection_id="xxxxxx",
#' category="xxxxxx", sort="xxxxxx"L, order="xxxxxx")


# Function of getting information about the restaurant

get_search<- function(api_key=NULL,
                      q = NULL, entity_id = NULL, entity_type = NULL,
                      start = NULL, count = NULL, lat = NULL,
                      lon = NULL,radius = NULL, cuisines = NULL,
                      establishment_type = NULL,collection_id = NULL,
                      category = NULL, sort = NULL, order = NULL) {
  # entity_type: city/subzone/zone/landmark/metro/group
  # sort: cost/rating/real_distance
  # order: asc/desc

  # Check the validation of api key
  apikey_check(api_key)

  URL <- 'https://developers.zomato.com'
  params <- list(
    q = q, entity_id = entity_id, entity_type = entity_type,
    start = start, count = count, lat = lat, lon = lon, radius = radius,
    cuisines = cuisines, establishment_type = establishment_type,
    category = category, collection_id = collection_id, sort = sort,
    order = order
  )

  # Sending request
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/", "search"),
    config = httr::add_headers("user-key" = api_key),
    query = params,
    httr::user_agent("httr")

  )

  # Check if parameters are right
  if (is.null(httr::content(resp)$results_found)){
    stop("Please try other parameter values.")
  }

  # Check whether the connection is successful
  apikey_connectioncheck(resp)

  # Convert json into dataframe
  sedata <- jsonlite::fromJSON(httr::content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)

  return(sedata$restaurants)
}
