#' @author Huazi Li <632473742@@qq.com>
#'
#' @description
#' Get Foodie and Nightlife Index, list of popular
#' cuisines and nearby restaurants around the given coordinates
#'
#' @param key API key, string
#' @param lat latitude, double
#' @param lon longitude, double
#'
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
#'
#'
#' @name
#' get_geocode
#'
#' @title
#' get geocode
#'
#' @export
#' @examples
#' get_geocode("528b6ee8d624e5e3e741f1fbd895b760",1.2,2.3)


get_geocode<-function(key=NULL,lat=NULL,lon=NULL){
  #check if given api
  apikey_check(key)
  # check if given lat and lon
  if (is.null(lat) | is.null(lon)){
    stop("Please giving lat and lon.")
  }

  url <- httr::modify_url("https://developers.zomato.com",
                          path = "/api/v2.1/geocode")

  res <- httr::GET(url,httr::add_headers(Accept="application/json",
                                         "user-key"=key),
                   query=list("lat"=lat,"lon"=lon))
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  if(length(datalist$nearby_restaurants)==0){
    stop("Please try another lat and lon.")
  }
  return(datalist$nearby_restaurants[-1,])
}
