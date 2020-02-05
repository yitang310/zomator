
# this is the test for functions establishment, geocode, locations, location_detail

context("Test functions part 2")

#please replace with your own API key.
key2 <- "testkey"

#test establishment

test_that("getestablishments", {
  expect_error(get_establishments(""))
  expect_error(get_establishments("key"))
  expect_length(get_establishments(key2,280),1)
  expect_length(get_establishments(key2,280,1.2),1)
  expect_length(get_establishments(key2,280,1.2,2.3),1)
})

#test geocode

test_that("getgeocode", {
  expect_error(get_geocode(""))
  expect_error(get_geocode("key"))
  expect_error(get_geocode("key2",lat=2.65))
  expect_error(get_geocode("key2",lon=41.13))
  expect_length(get_geocode(key2,1.2,2.3),1)
})


#test location_details

test_that("getlocation_details", {
  expect_error(get_location_details(""))
  expect_error(get_location_details("key"))
  expect_error(get_location_details("key2",entity_id=1))
  expect_error(get_location_details("key",entity_type="city"))
  expect_length(get_location_details(key2,1,"city"),1)
  expect_error(get_location_details("1234",1,"balabala"))
})


#test Location

test_that("getlocations", {
  expect_error(get_locations(""))
  expect_error(get_locations("123456"))
  expect_length(get_locations(key2,"vancouver"),1)
  expect_length(get_locations(key2,"vancouver",1,2),1)
  expect_length(get_locations(key2,"vancouver",1,2,1),1)
  expect_length(get_locations(key2,"vancouver",1),1)
})


