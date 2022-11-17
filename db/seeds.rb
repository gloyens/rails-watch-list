# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://tmdb.lewagon.com/movie/top_rated'
json = URI.open(url).read
hash = JSON.parse(json)

movies = hash["results"]

puts 'Cleaning database...'
Movie.destroy_all

movies.each do |m|
  Movie.create(title: m['title'], overview: m['overview'], poster_url: m['poster_path'], rating: m['vote_average'])
end
