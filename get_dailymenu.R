library(httr)

to_df <- function(response) {
  jsonlite::fromJSON(
    httr::content(
      response, as = "text", type = "application/json", encoding = "UTF-8"
    ),
    flatten = TRUE
  )
}

URL <- 'https://developers.zomato.com/api/v2.1/search?'
api_key <- "388fd712b5816621ec4d4dfd6c71bbb2"

get_dailymenu = function(res_id, dish_id) {
  resp <- httr::GET(
    url = URL,
    path = paste0("/api/v2.1/","dailymenu"),
    config = httr::add_headers("user-key" = api_key),
    query = list(res_id = res_id),
    user_agent("httr")
  )
  
  dmdata <- to_df(resp)
  print(dmdata$daily_menus)
  
  df1 <- dmdata$daily_menus$daily_menu.dishes[[1]]
  df2 <- dmdata$daily_menus$daily_menu.dishes[[2]]
  df3 <- dmdata$daily_menus$daily_menu.dishes[[3]]
  df4 <- dmdata$daily_menus$daily_menu.dishes[[4]]
  df5 <- dmdata$daily_menus$daily_menu.dishes[[5]]
  
  df <- rbind(df1,df2,df3,df4,df5)
  df$dish.dish_id <- as.integer(df$dish.dish_id)
  
  for (i in 1:24){
    if (df$dish.dish_id[i] == dish_id){
      print(paste(df$dish.dish_id[i],",",df$dish.name[i],",",df$dish.price[i]))
    } 
  }
}