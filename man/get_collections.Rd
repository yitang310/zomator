% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getcollections.R
\name{get_collections}
\alias{get_collections}
\title{get Zomato Restaurant collections}
\usage{
get_collections(key = NULL, city_id = NULL, lat = NULL, lon = NULL,
  count = NULL)
}
\arguments{
\item{key}{your API key}

\item{city_id}{id of the city for which collections are needed}

\item{lat}{latitude}

\item{lon}{longitude}

\item{count}{number of max results to display}
}
\value{
collection_id (integer, optional) ID of the collection of restaurants
title (string, optional) Collection name
url (string, optional) URL of the collection page
description (string, optional) Short description of the collection
image_url (string, optional) URL for header image of the collection
res_count (integer, optional) Number of restaurants in the collection
share_url (string, optional) short URL for apps and social sharing
}
\description{
search for Zomato Restaurant Collections in a City
}
\examples{
get_collections(key="testkey",city_id=256)
}
\author{
Yi Tang <tangyi2014@gmail.com>
}
