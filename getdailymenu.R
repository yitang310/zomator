#' @author Chenxi Yang <chenxxiyang@@gmail.com>
#'
#' @description
#' return details of restaurants listed in a city
#' 
#' @param user-key your API key
#' @param res_id id of restaurant
#' @param dish_id id of dish
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
#' get daily menu
#' 
#' @export
#' @examples
#' get_dailymenu(api_key="xxxxxx", res_id="xxxxxx", dish_id="xxxxxx")

source("getcategories.R")

# Function of getting daily menu
get_dailymenu = function(api_key, res_id, dish_id) {
  
  # Check the validation of api key
  apikey_check(key)
  
  # Check whether res_id is given
  if (is.null(res_id)){
    stop("Please enter the restaurant ID.")
  }
  
  # Check whether dish_id is given
  if (is.null(dish_id)){
    stop("Please enter the dish ID.")
  }
  
  URL <- 'https://developers.zomato.com/api/v2.1/search?'
  params <- list(res_id = res_id)
  
  # Sending request
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/","dailymenu"),
    config = httr::add_headers("user-key" = api_key),
    query = params,
    user_agent("httr")
  )
  
  # Check whether the connection is successful
  apikey_connectioncheck(resp=NULL)
  
  # Convert json into dataframe
  dmdata <- jsonlite::fromJSON(content(resp, as = 'text', encoding = 'UTF-8'), flatten = TRUE)
  
  print(dmdata$daily_menus)
  
  # Retrieve dataframes in dishes
  df1 <- dmdata$daily_menus$daily_menu.dishes[[1]]
  df2 <- dmdata$daily_menus$daily_menu.dishes[[2]]
  df3 <- dmdata$daily_menus$daily_menu.dishes[[3]]
  df4 <- dmdata$daily_menus$daily_menu.dishes[[4]]
  df5 <- dmdata$daily_menus$daily_menu.dishes[[5]]
  
  df <- rbind(df1,df2,df3,df4,df5)
  df$dish.dish_id <- as.integer(df$dish.dish_id)
  
  # Given the dish information of the dish chosen
  for (i in 1:24){
    if (df$dish.dish_id[i] == dish_id){
      print(paste(df$dish.dish_id[i],",",df$dish.name[i],",",df$dish.price[i]))
    } 
  }
}