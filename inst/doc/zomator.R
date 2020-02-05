## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
#library(zomator)

key="528b6ee8d624e5e3e741f1fbd895b760"

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("zomator")

## ----installgithub, eval=FALSE-------------------------------------------
#  install.packages("devtools")
#  devtools::install_github("yitang310/zomator")

## ------------------------------------------------------------------------
library("zomator")

## ------------------------------------------------------------------------
get_categories(key=key)

## ------------------------------------------------------------------------
get_cities(key=key,q="van")

## ------------------------------------------------------------------------
get_collections(key=key,city_id=256)

## ------------------------------------------------------------------------
get_cuisines(key=key,city_id=256)

## ------------------------------------------------------------------------
get_establishments(key =key,city_id = 256)

## ------------------------------------------------------------------------
get_geocode(key=key,1.2,2.3)

## ------------------------------------------------------------------------
data_geocode <- get_geocode(key=key,1.2,2.3)
plot(data_geocode$restaurant.location.latitude,data_geocode$restaurant.location.longitude,main="The Locations of 10 Restaurants in Alamo Heights San Antonio")

## ------------------------------------------------------------------------
get_location_details(key=key,1,"city")

## ------------------------------------------------------------------------
data_location_details<-get_location_details(key=key,256,"city")
barplot(data_location_details$all_reviews_count,names.arg=data_location_details$name,las=2,cex.names = 0.5,cex.lab = 0.65, main = "Reviews Count for 10 Restaurants in Metro Vancouver British Columbia",cex.main=0.9)
barplot(data_location_details$photo_count,names.arg=data_location_details$name,las=2,cex.names = 0.5,cex.lab = 0.65, main = "Photo Count of 10 Restaurants in Metro Vancouver British Columbia",cex.main=0.9)

## ------------------------------------------------------------------------
get_locations(key=key,query="van",count=1)

## ------------------------------------------------------------------------
get_dailymenu(key=key, res_id="16507624")

## ------------------------------------------------------------------------
get_restaurant(key=key, res_id="16774318")

## ----eval=FALSE----------------------------------------------------------
#  get_reviews(key=key, res_id="16774318")

## ------------------------------------------------------------------------
get_search(key=key, q="van")

