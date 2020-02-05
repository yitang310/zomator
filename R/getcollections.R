#' @author
#' Yi Tang <tangyi2014@@gmail.com>
#'
#' @description
#' search for Zomato Restaurant Collections in a City
#'
#' @param key your API key
#' @param city_id id of the city for which collections are needed
#' @param lat latitude
#' @param lon longitude
#' @param count number of max results to display
#'
#' @return
#' collection_id (integer, optional) ID of the collection of restaurants
#' title (string, optional) Collection name
#' url (string, optional) URL of the collection page
#' description (string, optional) Short description of the collection
#' image_url (string, optional) URL for header image of the collection
#' res_count (integer, optional) Number of restaurants in the collection
#' share_url (string, optional) short URL for apps and social sharing
#'
#' @name
#' get_collections
#'
#' @title
#' get Zomato Restaurant collections
#'
#' @export
#' @examples
#' get_collections(key="testkey",city_id=256)

#function for finding Zomato Restaurant Collections in a City
get_collections<-function(key=NULL,city_id=NULL,lat=NULL,lon=NULL,count=NULL){
  #check if given api
  apikey_check(key)
  #check if the testkey
  if (key=="testkey"){
    testword<-"This is a testkey."
    return(testword)
  }
  #check if given city_id
  if (is.null(city_id)){
    stop("Please enter the city ID. You can seach city ID by using get_cities function.")
  }
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/collections")
  res <- httr::GET(
    url = urlcate,
    config = httr::add_headers("user-key" = key),
    query = list("city_id"=city_id,"lat"=lat,"lon"=lon,"count"=count)
  )
  #check if the api key can used to connect to zomato
  apikey_connectioncheck(res)
  #read json into dataframe
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  #check if return results
  if (length(datalist$collections) == 0){
    stop("Please try another city ID.")
  }
  #only want the dataframe
  datalist<-datalist$collections
  return(datalist)
}

