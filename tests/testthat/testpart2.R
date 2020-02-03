
# this is the test for functions establishment, geocode, locations, location_detail

context("Test functions part 2")


#test establishment

test_that("getestablishments", {
  expect_error(get_establishments(""))
  expect_error(get_establishments("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_length(get_establishments("528b6ee8d624e5e3e741f1fbd895b760",280),2)
  expect_length(get_establishments("528b6ee8d624e5e3e741f1fbd895b760",280,1.2),2)
  expect_length(get_establishments("528b6ee8d624e5e3e741f1fbd895b760",280,1.2,2.3),2)
})

#test geocode

test_that("getgeocode", {
  expect_error(get_geocode(""))
  expect_error(get_geocode("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_error(get_geocode("528b6ee8d624e5e3e741f1fbd895b760",lat=2.65))
  expect_error(get_geocode("528b6ee8d624e5e3e741f1fbd895b760",lon=41.13))
  expect_length(get_geocode("528b6ee8d624e5e3e741f1fbd895b760",1.2,2.3),2)
})


#test location_details

test_that("getlocation_details", {
  expect_error(get_location_details(""))
  expect_error(get_location_details("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_error(get_location_details("528b6ee8d624e5e3e741f1fbd895b760",entity_id=1))
  expect_error(get_location_details("528b6ee8d624e5e3e741f1fbd895b760",entity_type="city"))
  expect_length(get_location_details("528b6ee8d624e5e3e741f1fbd895b760",1,"city"),2)
  expect_error(get_location_details("528b6ee8d624e5e3e741f1fbd895b760",1,"balabala"))
})


#test Location

test_that("getlocations", {
  expect_error(get_locations(""))
  expect_error(get_locations("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_length(get_locations("528b6ee8d624e5e3e741f1fbd895b760","New York"),2)
  expect_length(get_locations("528b6ee8d624e5e3e741f1fbd895b760","New York",1.2),2)
  expect_length(get_locations("528b6ee8d624e5e3e741f1fbd895b760","New York",1,2),2)
  expect_length(get_locations("528b6ee8d624e5e3e741f1fbd895b760","New York",1,2,1),2)
  expect_length(get_locations("528b6ee8d624e5e3e741f1fbd895b760","New York",1)$content$location_suggestions,1)
})


