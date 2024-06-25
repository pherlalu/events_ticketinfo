# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |classification_name|
#     Movieclassification.find_or_create_by!(name: classification_name)
#   end
AdminUser.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password'
  user.password_confirmation = 'password'
end if Rails.env.development?

require 'net/http'
require 'json'

# Define the base URL for the Ticketmaster API
base_url = "https://app.ticketmaster.com/discovery/v2/events.json?apikey=kGZPifjKxWY1WP72vGaTeiWddM2Gdawh"

# Make a request to the Ticketmaster API
uri = URI(base_url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

# Iterate over the events in the response
data["_embedded"]["events"].each do |event_data|
  # Create the venue for the event
  venue_data = event_data["_embedded"]["venues"][0]
  venue = Venue.find_or_create_by!(
    venue_id: venue_data["id"],
    name: venue_data["name"],
    address: venue_data["address"]["line1"],
    city: venue_data["city"]["name"],
    state: venue_data["state"]["name"],
    country: venue_data["country"]["name"]
  )

  # Create the classification for the event
  classification_data = event_data["classifications"][0]
  classification = Classification.find_or_create_by!(
    classification_id: classification_data["segment"]["id"],
    segment: classification_data["segment"]["name"],
    genre: classification_data["genre"]["name"]
  )

  # Create a new event
  event = Event.find_or_create_by!(
    event_id: event_data["id"],
    name: event_data["name"],
    url: event_data["url"],
    image_url: event_data["images"][0]["url"],
    info: venue_data["generalInfo"] ? venue_data["generalInfo"]["generalRule"] : "Information not yet available.",
    min_price: event_data["priceRanges"][0]["min"],
    max_price: event_data["priceRanges"][0]["max"],
    date_time: DateTime.parse(event_data["dates"]["start"]["dateTime"]),
    venue: venue,
    classification: classification
  )

  # Create the artists for the event
  artist_data = event_data["_embedded"]["attractions"]
  artist_data.each do |artist|
    artist = Artist.find_or_create_by(
      artist_id: artist["id"],
      name: artist["name"],
      url: artist["url"],
      image_url: artist["images"][0]["url"]
    )
    event.artists << artist unless event.artists.include?(artist)
  end
end
