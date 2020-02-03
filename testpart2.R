
# this is the test for functions establishment, geocode, locations, location_detail

context("Test functions part 2")


#test establishment

test_that("Establishments", {
  expect_error(establishments_api(""))
  expect_error(establishments_api("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_length(establishments_api("528b6ee8d624e5e3e741f1fbd895b760",280),2)
  expect_length(establishments_api("528b6ee8d624e5e3e741f1fbd895b760",280,1.2),2)
  expect_length(establishments_api("528b6ee8d624e5e3e741f1fbd895b760",280,1.2,2.3),2)
})

#test geocode

test_that("Geocode", {
  expect_error(geocode_api(""))
  expect_error(geocode_api("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_error(geocode_api("528b6ee8d624e5e3e741f1fbd895b760",lat=2.65))
  expect_error(geocode_api("528b6ee8d624e5e3e741f1fbd895b760",lon=41.13))
  expect_length(geocode_api("528b6ee8d624e5e3e741f1fbd895b760",1.2,2.3),2)
})


#test location_details

test_that("Location Details", {
  expect_error(location_details_api(""))
  expect_error(location_details_api("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_error(location_details_api("528b6ee8d624e5e3e741f1fbd895b760",entity_id=1))
  expect_error(location_details_api("528b6ee8d624e5e3e741f1fbd895b760",entity_type="city"))
  expect_length(location_details_api("528b6ee8d624e5e3e741f1fbd895b760",1,"city"),2)
  expect_error(location_details_api("528b6ee8d624e5e3e741f1fbd895b760",1,"balabala"))
})


#test Location

test_that("Location", {
  expect_error(locations_api(""))
  expect_error(locations_api("528b6ee8d624e5e3e741f1fbd895b760"))
  expect_length(locations_api("528b6ee8d624e5e3e741f1fbd895b760","New York"),2)
  expect_length(locations_api("528b6ee8d624e5e3e741f1fbd895b760","New York",1.2),2)
  expect_length(locations_api("528b6ee8d624e5e3e741f1fbd895b760","New York",1,2),2)
  expect_length(locations_api("528b6ee8d624e5e3e741f1fbd895b760","New York",1,2,1),2)
  expect_length(locations_api("528b6ee8d624e5e3e741f1fbd895b760","New York",1)$content$location_suggestions,1)
})


