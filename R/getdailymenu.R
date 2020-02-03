#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' Get daily menu of a restaurant
#'
#' @param user-key your API key
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
#' get_dailymenu(api_key="528b6ee8d624e5e3e741f1fbd895b760", res_id="16507624")

# Function of getting daily menu of a restaurant

get_dailymenu <- function(api_key=NULL, res_id=NULL) {

  # Check the validation of api key
  apikey_check(api_key)

  # Check whether res_id is given
  if (is.null(res_id)){
    stop("Please enter the restaurant ID.")
  }

  URL <- 'https://developers.zomato.com'
  params <- list("res_id" = res_id)

  # Sending request
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/","dailymenu"),
    config = httr::add_headers("user-key" = api_key),
    query = params,
    httr::user_agent("httr")
  )

  # Check whether the connection is successful
  apikey_rescheck(resp)

  # Convert json into dataframe
  dmdata <- jsonlite::fromJSON(httr::content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)

  return(dmdata$daily_menus)
}

# Check whether the res_id and api connection
apikey_rescheck<-function(res){
  print(res)
  if (!is.null(httr::content(res)$code)){
    if (httr::content(res)$code==403){
      stop("please try another API key.")
    } else{
      stop("please try another res_id.")
    }
  }
}
