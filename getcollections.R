#Enter parameter values
#user-key: your API key
#city_id: id of the city for which collections are needed
#lat: latitude
#lon: longitude
#count: number of max results to display

#Returns Zomato Restaurant Collections in a City
#collection_id (integer, optional): ID of the collection of restaurants 
#title (string, optional): Collection name 
#url (string, optional): URL of the collection page 
#description (string, optional): Short description of the collection 
#image_url (string, optional): URL for header image of the collection 
#res_count (integer, optional): Number of restaurants in the collection 
#share_url (string, optional): short URL for apps and social sharing

#function for finding Zomato Restaurant Collections in a City
get_collections<-function(key,city_id,lat=NULL,lon=NULL,count=NULL){
  source("getcategories.R")
  apikey_check(key)
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
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  if (length(datalist$collections) == 0){
    stop("Please try another city ID.")
  }
  datalist<-datalist$collections
  return(datalist)
}

