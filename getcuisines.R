#Enter parameter values
#user-key: your API key
#city_id: id of the city for which collections are needed
#lat: latitude
#lon: longitude

#Returns Zomato Restaurant Collections in a City
#cuisine_id (integer): ID of the cuisine 
#cuisine_name (string): Name of the cuisine

#function for finding all cuisines of restaurants listed in a city
get_cuisines<-function(key,city_id,lat=NULL,lon=NULL){
  source("getcategories.R")
  apikey_check(key)
  if (is.null(city_id)){
    stop("Please enter the city ID. You can seach city ID by using get_cities function.")
  }
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/cuisines")
  res <- httr::GET(
    url = urlcate, 
    config = httr::add_headers("user-key" = key),
    query = list("city_id"=city_id,"lat"=lat,"lon"=lon)
  )
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  if (length(datalist$cuisines) == 0){
    stop("Please try another city ID.")
  }
  datalist<-datalist$cuisines
  return(datalist)
}

