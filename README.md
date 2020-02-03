[![Build Status](https://travis-ci.org/yitang310/zomator.svg?branch=master)](https://travis-ci.org/yitang310/zomator)

# zomator
Wrapper to the Zomato API

# Installation
`zomator` can be installed from our group [Github](https://github.com/yitang310/zomator). 

# Usage
In order to access to Zomato, an API key is required, which can be obtained [here](https://developers.zomato.com/api).

Inside `zomator`, there are 12 functions:

| Category |  Function Name  | Description  | Parameters | Example |
|  ----  | ----  | ---- | ---- | ---- |
| Common | get_categories | Get list of Categories | *API_key* | get_categories('API_key') |
| | get_cities  | Get city details | *API_key, query, lat, lon, city_id, count* | get_cities('API_key', query='van') |
| | get_collections | Get Zomato collections in a city | *API_key, city_id, lat, lon, count* | get_collections('API_key', city_id=256) |
| | get_cuisines | Get list of all cuisines in a city | *API_key, city_id, lat, lon* | get_cuisines('API_key', city_id=256)
| | get_establishments | Get list of restaurant types in a city | *API_key, city_id, lat, lon* | 
| | get_geocode | Get location details based on coordinates | *API_key, lat, lon* | 
| Location | get_location_details | Get Zomato location details | *API_key, entity_id, entity_type* |
| | get_locations | Search for locations | *API_key, location_name, lat, lon, count* |
| Restaurant | get_dailymenu | Get daily menu of a restaurant |  *API_key, res_id* | get_restaurant('API_key', res_id="16774318") |
| | get_restaurant | Get restaurant details | *API_key, res_id* | get_restaurant('API_key', res_id="16774318") |
| | get_reviews | Get restaurant reviews | *API_key, res_id* | get_reviews('API_key', res_id="16774318") |
| | get_search | Search for restaurants | *API_key, query, entity_id, entity_type, lat, lon, radius, cuisines, establishment_type, collection_id, sort, order* | get_search('API_key') |
