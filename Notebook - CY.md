# Notebook - Chenxi Yang

*January 29, 2020*

Our team decided to develop a R package wrapping an API of `Zomato`. The very first step is to get the api key on the website. Then, applying the library named `httr` to connect to that api. Last, constructing a function named `to_df`, which converts json into dataframe.

I've done one of functions named `getdailymenu`. At the beginning, I set two parameters `api_key` and `res_id`. Once users input the `res_id`, the function will output a dataframe about all information about `dailymenus`, including daily_menu_id, start_date, name and dishes. After observing the column of dishes, I noticed that there are several dataframes inside. Therefore, I added one more parameter `dish_id` to retrieve more details about the dish chosen by users.

*January 30, 2020*

Today, I've done another functions named `getreviews` that is similar to `getdailymenu`. There are two parameters `api_key` and `res_id`. Once users input the `res_id`, the function will output a dataframe about all information about `reviews`, including rating, reviews text, id, review_time_friendly and so on.

*January 31, 2020*

Making slight changes and adding documentation workflows on both function `getdailymenu` and `getreviews`.

*February 1, 2020*

Firstly, adding some aspects on documentation workflow including author, description, name, title and examples. Another function named `getrestaurant` is done. This function has two parameters `api_key` and `res_id`, which is used to retrieve all information about the chosen restaurant.

Then, adding two functions `apikey_check` and `apikey_connectioncheck` to check the validation of api key and whether the connection is successful on all three functions. Also, one if-else statement is used to check whether parameters are given.

Last, adding comments on statements to make them easier to understand.
