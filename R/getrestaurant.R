#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' Get restaurant details
#'
#' @param key your API key
#' @param res_id id of restaurant whose details are requested
#'
#' @name
#' get_restaurant
#'
#' @title
#' Get restaurant details
#'
#' @export
#' @examples
#' get_restaurant(key="testkey", res_id="16774318")


# Function of getting information about the restaurant

get_restaurant <- function(key=NULL, res_id=NULL) {

  # Check the validation of api key
  apikey_check(key)

  #check if the testkey
  if (key=="testkey"){
    testword<-"This is a testkey."
    return(testword)
  }

  # Check whether res_id is given
  if (is.null(res_id)){
    stop("Please enter the restaurant ID.")
  }

  URL <- 'https://developers.zomato.com'
  params <- list(res_id = res_id)

  # Sending request
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/", "restaurant"),
    config = httr::add_headers("user-key" = key),
    query = params,
    httr::user_agent("httr")
  )

  # Check whether the connection is successful
  apikey_rescheck(resp)

  # Convert json into dataframe
  resdata <- jsonlite::fromJSON(httr::content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)

  # Change the format of dataframe
  resdata <- unlist(resdata, recursive = FALSE)
  names(resdata) <- gsub("restaurant.|location.|user_rating.", "", names(resdata))
  column <- "apikey|url|link|thumb|featured_image|zomato_events|R.res_id|custom|profile_image"
  names(resdata) <- gsub("restaurant.|location.|user_rating.", "", names(resdata))
  resdata <- as.data.frame(resdata)[1,]

  return(resdata)
}
