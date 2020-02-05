#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' Search for restaurants
#'
#' @param key your API key
#' @param q search keyword
#' @param entity_id location id
#' @param entity_type location type city/subzone/zone/landmark/metro/group
#' @param start fetch results after offset
#' @param count max number of results to display
#' @param lat latitude
#' @param lon longitude
#' @param radius radius around (lat,lon)
#' @param cuisines list of cuisine id's separated by comma
#' @param establishment_type estblishment id obtained from establishments call
#' @param collection_id collection id obtained from collections call
#' @param category category ids obtained from categories call
#' @param sort sort restaurants by cost/rating/real_distance,choosing from cost,rating and real_distance
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
#' get_search(key="testkey", q="van")


# Function of getting information about the restaurant

get_search<- function(key=NULL,
                      q = NULL, entity_id = NULL, entity_type = NULL,
                      start = NULL, count = NULL, lat = NULL,
                      lon = NULL,radius = NULL, cuisines = NULL,
                      establishment_type = NULL,collection_id = NULL,
                      category = NULL, sort = NULL, order = NULL) {
  # entity_type: city/subzone/zone/landmark/metro/group
  # sort: cost/rating/real_distance
  # order: asc/desc

  # Check the validation of api key
  apikey_check(key)

  #check if the testkey
  if (key=="testkey"){
    testword<-"This is a testkey."
    return(testword)
  }

  URL <- 'https://developers.zomato.com'
  params <- list(
    q = q, entity_id = entity_id, entity_type = entity_type,
    start = start, count = count, lat = lat, lon = lon, radius = radius,
    cuisines = cuisines, establishment_type = establishment_type,
    category = category, collection_id = collection_id, sort = sort,
    order = order
  )

  # Sending request
  res <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/", "search"),
    config = httr::add_headers("user-key" = key),
    query = params,
    httr::user_agent("httr")

  )

  # Check if parameters are right
  if (is.null(httr::content(res)$results_found)){
    stop("Please try other parameter values.")
  }

  # Check whether the connection is successful
  apikey_connectioncheck(res)

  # Convert json into dataframe
  sedata <- jsonlite::fromJSON(httr::content(res, as = 'text', encoding = 'UTF-8'), flatten = TRUE)

  return(sedata$restaurants)
}
