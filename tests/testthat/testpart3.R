# this is the test for functions get_dailymenu, get_reviews, get_restaurant, get_search
context("Test functions part 3")

#please replace xxxxxx with your own API key.
key3 <- "528b6ee8d624e5e3e741f1fbd895b760"

#test get_dailymenu
test_that("test get_dailymenu",{
  expect_error(get_dailymenus())
  expect_error(get_dailymenu("123456"))
  expect_error(get_dailymenu(key3, "123456"))
  expect_is(get_dailymenu(key3,16507624), "data.frame")
  expect_true(nrow(get_dailymenu(key3,16507624)) > 0)
})

#test get_reviews
test_that("test get_reviews",{
  expect_error(get_reviews())
  expect_error(get_reviews("123456"))
  expect_true(nrow(get_reviews(key3,256)) > 0)
  expect_true(ncol(get_reviews(key3,256)) != 0)
  expect_is(get_reviews(key3,16507624), "data.frame")
})

#test get_restaurant
test_that("test get_restaurant",{
  expect_error(get_restaurant())
  expect_error(get_restaurant("123456"))
  expect_is(get_restaurant(key3,16507624), "data.frame")
  expect_true(nrow(get_restaurant(key3,16507624)) == 1)
  expect_true(ncol(get_restaurant(key3,16507624)) != 0)
})

#test get_search
test_that("test get_search",{
  expect_error(get_search())
  expect_error(get_search("123456"))
  expect_is(get_search(key3), "data.frame")
  expect_true(length(get_search(key3)) != 0)
  expect_true(nrow(get_search(key3,lat="40.732013", lon="-73.996155")) == 20)
})
