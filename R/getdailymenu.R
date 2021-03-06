#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' Get daily menu of a restaurant
#'
#' @param key your API key
#' @param res_id id of restaurant whose details are requested
#'
#' @return
#' daily_menu_id (character) ID of the daily menu
#' start_date (character) start date of the daily menu
#' name (character) name of the daily menu
#' dishes (data frame) dishes on the daily menu
#'
#' @name
#' get_dailymenu
#'
#' @title
#' Get daily menu of a restaurant
#'
#' @export
#' @examples
#' get_dailymenu(key="testkey", res_id="16507624")

# Function of getting daily menu of a restaurant

get_dailymenu <- function(key=NULL, res_id=NULL) {

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
  params <- list(
    "res_id" = res_id)

  # Sending request
  res <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/","dailymenu"),
    config = httr::add_headers(
      "user-key" = key),
    query = params,
    httr::user_agent("httr")
  )

  # Check whether the connection is successful
  apikey_rescheck(res)

  # Convert json into dataframe
  dmdata<-read_json(res)
  return(dmdata$daily_menus)
}

# Check whether the res_id and api connection
apikey_rescheck<-function(res){
  if (!is.null(httr::content(res)$code)){
    if (httr::content(res)$code==403){
      stop("please try another API key.")
    } else{stop("please try another res_id.")}
  }
}
