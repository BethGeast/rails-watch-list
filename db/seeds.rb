require 'open-uri'
require 'json'

Movie.destroy_all
top_rated_movies_url = 'https://tmdb.lewagon.com/movie/top_rated'
serialized_response = URI.parse(top_rated_movies_url).read
response = JSON.parse(serialized_response)
movies = response['results']
movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    rating: movie['vote_average'].round(1),
    poster_url: "https://image.tmdb.org/t/p/original#{movie['poster_path']}"
  )
end
