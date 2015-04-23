# We need to make sure we're getting a site that is just json data.
# Inlude the rest-client library - tell Ruby we're using it.
# Also use the JSON library for ruby. Include JSON library.
# Setup rest-client call
# Parse the data results from the Reddit APIs using the JSON library.
# Build an array of hashes. Convert it to a new data structure by iterating through it and building our own hashes.
# Every hash is going to represent a single story.
require 'rest-client'
require 'json'
def get_from_reddit
  #no parameters needed. We're just going to return the data from the json file.
  route = 'http://www.reddit.com/.json'
  raw_response = RestClient.get route
  response = JSON.load raw_response
  response["data"]["children"].map do |story|
    story_hash = {
      title: story["data"]["title"],
      score: score = story["data"]["score"],
      category: subreddit = story["data"]["subreddit"],
      author: author = story["data"]["author"]
    }
  end
end
def display_stories stories
  stories.sort_by! { |story| story[:score] }

  stories.reverse!

  stories.each do |story|
    # "Title: title, Category: category, Upvotes: score"
    puts "Title: #{story[:title]}"
    puts "Category: #{story[:category]}"
    puts "Upvotes: (#{story[:score]})"
    puts "Author: #{story[:author]}"
    puts ""
  end
end
puts "!!! Welcome to the NEWS API Aggregator !!!"
display_stories get_from_reddit