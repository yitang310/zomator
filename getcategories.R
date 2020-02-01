#Enter parameter values
#user-key: your API key

#Return the data frame of category types
#category_id (integer): ID of the category type 
#category_name (string): Name of the category type

#function for checking if api key is provided
apikey_check <- function(key = NULL){
  if (is.null(key)){
    stop("Please provide a zomato API key.")
  }
}

#function for getting categories
get_categories <- function(key){
  apikey_check(key)
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/categories")
  res <- httr::GET(
    url = urlcate,
    config = httr::add_headers("user-key" = key)
  )
  datalist <- jsonlite::fromJSON(
    httr::content(
      res, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
  datalist <- datalist$categories
  
  return(datalist)
}