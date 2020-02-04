#' @author Huazi Li <632473742@@qq.com>
#'
#' @description
#' Get Foodie Index, Nightlife Index, Top Cuisines
#' and Best rated restaurants in a given location
#'
#' @param key API key, string
#' @param entity_id location id obtained from locations api, integer
#' @param entity_type location type obtained from locations api, string
#' @return
#' dataframe
#' id (integer, optional): ID of the restaurant
#' name (string, optional): Name of the restaurant
#' url (string, optional): URL of the restaurant page
#' location (ResLocation, optional): Restaurant location details
#' average_cost_for_two (integer, optional): Average price of a meal for two people
#' price_range (integer, optional): Price bracket of the restaurant (1 being pocket friendly and 4 being the costliest)
#' currency (string, optional): Local currency symbol; to be used with price
#' thumb (string, optional): URL of the low resolution header image of restaurant
#' featured_image (string, optional): URL of the high resolution header image of restaurant
#' photos_url (string, optional): URL of the restaurant's photos page
#' menu_url (string, optional): URL of the restaurant's menu page
#' events_url (string, optional): URL of the restaurant's events page
#' user_rating (UserRating, optional): Restaurant rating details
#' has_online_delivery (boolean, optional): Whether the restaurant has online delivery enabled or not
#' is_delivering_now (boolean, optional): Valid only if has_online_delivery = 1; whether the restaurant is accepting online orders right now
#' has_table_booking (boolean, optional): Whether the restaurant has table reservation enabled or not
#' deeplink (string, optional): Short URL of the restaurant page; for use in apps or social shares
#' cuisines (string, optional): List of cuisines served at the restaurant in csv format
#' all_reviews_count (integer, optional): [Partner access] Number of reviews for the restaurant
#' photo_count (integer, optional): [Partner access] Total number of photos for the restaurant, at max 10 photos for partner access
#' phone_numbers (string, optional): [Partner access] Restaurant's contact numbers in csv format
#' photos (Array[Photo], optional): [Partner access] List of restaurant photos
#' all_reviews (Array[Review], optional): [Partner access] List of restaurant reviews
#'
#' @name
#' get_location_details
#'
#' @title
#' get location details
#'
#' @export
#' @examples
#' get_location_details("528b6ee8d624e5e3e741f1fbd895b760",1,"city")
#'



#function for given popular cuisines and nearby restaurants
get_location_details<-function(key=NULL,entity_id = NULL,entity_type = NULL){
  #check if given api
  apikey_check(key)
  #check if given entity_id and entity_type
  if(is.null(entity_id) | is.null(entity_type)){
    stop("Please enter entity_id and entity_type.")
  }
  url <- httr::modify_url("https://developers.zomato.com",
                          path = "/api/v2.1/location_details")

  resp <- httr::GET(url,httr::add_headers(Accept="application/json",
                                          "user-key"=key),
                    query=list(entity_id=entity_id,entity_type=entity_type))
  # read json into dataframe
  lodata <- jsonlite::fromJSON(httr::content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)

  a <- names(lodata$best_rated_restaurant)
  c <- "apikey|url|link|thumb|featured_image|zomato_events|R.res_id|custom|profile_image"
  b <- lodata$best_rated_restaurant[!grepl(c, a)]
  names(b) <- gsub("restaurant.|location.|user_rating.", "", names(b))

  return(b)
}
