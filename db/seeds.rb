# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

Movie.destroy_all


api_url = 'http://tmdb.lewagon.com/movie/top_rated'
api_movie = URI.open(api_url).read
movies = JSON.parse(api_movie)['results']

movies.each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: "https://image.tmdb.org/t/p/original#{movie['backdrop_path']}", rating: movie['vote_average'])
end
