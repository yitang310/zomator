# this is the test for functions get_categories, get_cities, get_collections, get_cuisines
context("Test functions part 1")

#please replace xxxxxx with your own API key.
key1<-"528b6ee8d624e5e3e741f1fbd895b760"

#test get_categories
test_that("test get_categories",{
  expect_error(get_categories())
  expect_error(get_categories("123456"))
  expect_is(get_categories(key1), "data.frame")
  expect_type(get_categories(key1)$categories.name,"character")
  expect_true(nrow(get_categories(key1)) > 0)
})

#test get_cities
test_that("test get_cities",{
  expect_error(get_cities())
  expect_error(get_cities("123456"))
  expect_error(get_cities(key1))
  expect_is(get_cities(key1,"van"), "data.frame")
  expect_type(get_cities(key1,"van",lat=NULL,lon=NULL,city_ids=NULL,count=12),"list")
})

#test get_collections
test_that("test get_collections",{
  expect_error(get_collections())
  expect_error(get_collections("123456"))
  expect_error(get_collections(key1))
  expect_is(get_collections(key1,256), "data.frame")
  expect_true(nrow(get_collections(key1,256)) != 0)
})

#test get_cuisines
test_that("test get_cuisines",{
  expect_error(get_cuisines())
  expect_error(get_cuisines("123456"))
  expect_error(get_cuisines(key1))
  expect_is(get_collections(key1,256), "data.frame")
  expect_true(nrow(get_cuisines(key1,256)) == 125)
})

