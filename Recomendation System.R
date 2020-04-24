library(data.table)
library(dplyr)
##What kind of movie are you looking for?
##Genre
##Type
##Recent (last 10 years), don't care

movies <- read.csv('movie_data.csv')


#  v = vote count; m = minimum votes required; R = average rating of the movie; C = mean vote across all movies
#  weightedrating <- (v/(v+m) * R) + (m/(m+v) * C)

#options for type:
unique(movies$titleType)

recommend <- function(genre, type, age) { 
  PossMovie <- movies[movies$genres %like% genre,]
  PossMovie <- PossMovie[PossMovie$titleType == type,]
  if (age == "New") {
    PossMovie <- subset(PossMovie, PossMovie$startYear >= 2000) 
  } else if (age == "Old") {
    PossMovie <- subset(PossMovie, PossMovie$startYear < 2000)
  } else {
    PossMovie <- PossMovie
  }
  PossMovie$WeightedRating <- NA
  for (i in 1:dim(PossMovie)[1]){
    v = PossMovie$numVotes[i]
    m = quantile(PossMovie$averageRating, prob = .95)
    C = mean(PossMovie$averageRating)
    R = PossMovie$averageRating[i]
    PossMovie$WeightedRating[i] <- (v/(v+m) * R) + (m/(m+v) * C)
  }
  Ordered <- PossMovie[order(PossMovie$WeightedRating, decreasing = TRUE),]
  Ordered <- Ordered %>% select(title, genres, titleType, startYear, WeightedRating)
  Top5 <- Ordered[1:5,]
  return(Top5)
}

recommend('Animation', 'movie', 'Old' )

unique(movies$titleType)


