#function for searching categories
get_categories <- function(key){
  apikey_check(key)
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/categories")
  print(urlcate)
  
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