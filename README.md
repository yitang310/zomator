[![Build Status](https://travis-ci.org/yitang310/zomator.svg?branch=master)](https://travis-ci.org/yitang310/zomator)

# zomator
Wrapper to the Zomato API

### Author
Yi Tang, Chenxi Yang, Huazi Li

### Installation
`zomator` can be installed from our group [Github](https://github.com/yitang310/zomator). 

```
install.packages("devtools")

devtools::install_github("yitang310/zomator")
```

### Usage
In order to access to Zomato, an API key is required, which can be obtained [here](https://developers.zomato.com/api).

Inside `zomator`, there are 12 functions:

| Category |  Function Name  | Description  | Parameters | Example |
|  ----  | ----  | ---- | ---- | ---- |
| Common | get_categories | Get list of Categories | *key* | get_categories('key') |
| | get_cities  | Get city details | *key, q, lat, lon, city_ids, count* | get_cities('key', q='van') |
| | get_collections | Get Zomato collections in a city | *key, city_id, lat, lon, count* | get_collections('key', city_id=256) |
| | get_cuisines | Get list of all cuisines in a city | *key, city_id, lat, lon* | get_cuisines('key', city_id=256)
| | get_establishments | Get list of restaurant types in a city | *key, city_id, lat, lon* | get_establishments(key, city_id = 280) |
| | get_geocode | Get location details based on coordinates | *key, lat, lon* | get_geocode(key, 1.2, 2.3) |
| Location | get_location_details | Get Zomato location details | *key, entity_id, entity_type* | get_location_details(key, 1, "city") |
| | get_locations | Search for locations | *key, query, lat, lon, count* | get_locations(key, "van") |
| Restaurant | get_dailymenu | Get daily menu of a restaurant |  *key, res_id* | get_restaurant('key', res_id="16774318") |
| | get_restaurant | Get restaurant details | *key, res_id* | get_restaurant('key', res_id="16774318") |
| | get_reviews | Get restaurant reviews | *key, res_id* | get_reviews('key', res_id="16774318") |
| | get_search | Search for restaurants | *key, q, entity_id, entity_type, start, count, lat, lon, radius, cuisines, establishment_type, collection_id, category, sort, order* | get_search('key', q="van") |

### Work Distribution

**Readme:** Yang (editor)

**Description:** Tang (editor)

**Vignettes:** Yang (main editor), Tang (editor), Li (editor)



**R functions:**

- get_categories: Tang (author)

- get_cities: Tang (author)

- get_collections: Tang (author)

- get_cuisines: Tang (author)

- get_establishments: Li (author), Tang (editor)

- get_geocode: Li (author), Tang (editor)

- get_location_details: Li (author), Yang (editor)

- get_locations: Li (author), Tang (editor)

- get_dailymenu: Yang (author) 

- get_restaurant: Yang (author)

- get_reviews: Yang (author)

- get_search: Yang (author)


**Tests:**

testpart1: Tang (author)

testpart2: Li (author)

testpart3: Yang (author)
