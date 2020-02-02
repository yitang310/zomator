#' @author Yi Tang <tangyi2014@@gmail.com>
#'
#' Enter parameter values
#' @param user-key: your API key
#'
#' @return the data frame of category types
#' category_id (integer): ID of the category type
#' category_name (string): Name of the category type
#'
#' @export
#' @examples
#' get_categories(key="xxxxxx")


#function for getting categories
get_categories <- function(key = NULL){
  #check if given api
  apikey_check(key)
  baseurl <- "https://developers.zomato.com"
  urlcate <- httr::modify_url(baseurl, path = "/api/v2.1/categories")
  res <- httr::GET(
    url = urlcate,
    config = httr::add_headers("user-key" = key)
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
  #only want the dataframe
  datalist <- datalist$categories
  return(datalist)
}

#function for checking if api key is provided
apikey_check <- function(key = NULL){
  if (is.null(key)){
    stop("Please provide a zomato API key.")
  }
}
#function for checking if api can used to connect to zomato
apikey_connectioncheck<-function(res = NULL){
  if (!is.null(httr::content(res)$code)){
    stop("please try another API key.")
  }
}
