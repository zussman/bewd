# We need to make sure we're getting a site that is just json data.
# Inlude the rest-client library - tell Ruby we're using it.
# Also use the JSON library for ruby. Include JSON library.
# Setup rest-client call
# Parse the data results from the Reddit APIs using the JSON library.
# Build an array of hashes. Convert it to a new data structure by iterating through it and building our own hashes.
# Every hash is going to represent a single story.
require 'rest-client'
require 'json'

#Award double score for cat or dog posts
def cat_dog array
  array.each do |hash|
    if hash[:title].downcase.include?("cat") or hash[:title].downcase.include?("dog")
      hash[:score] = hash[:score].to_i * 2
    end
  end
end

#Get Data from Reddit
def get_from_reddit
  #no parameters needed. We're just going to return the data from the json file.
  route = 'http://www.reddit.com/.json'
  raw_response = RestClient.get route
  response = JSON.load raw_response
  response["data"]["children"].map do |story|
    story_hash = {
      title: story["data"]["title"],
      score: story["data"]["score"],
      category: story["data"]["subreddit"],
      author: story["data"]["author"]
    }
  end
end

#Get Data from Digg
def get_from_digg
  route = 'http://digg.com/api/news/popular.json'
  raw_response = RestClient.get route
  response = JSON.load raw_response
  response["data"]["feed"].map do |story|
    categories = []
    story["content"]["tags"].map do |tags|
        categories.push(tags["display"]) # Push the 'tags' for each Digg article to an array.
    end
    category_string =  categories.join(", ") # Make a string for each story's category array for Digg.
    story_hash = {
      title: story["content"]["title"],
      score: story["digg_score"],
      category: category_string, # There are multiple categories so you're going to have to use .join to get all the different categories to be part of the array.
      author: story["content"]["author"]
    }
  end
end

#Get Data form Mashable
def get_from_mashable
  route = 'http://mashable.com/stories.json'
  raw_response = RestClient.get route
  response = JSON.load raw_response
  response["hot"].map do |story|
    story_hash = {
      title: story["title"],
      score: story["shares"]["total"],
      category: story["channel"],
      author: story["author"]
    }
  end
end

#Tell it how to display the stories
def display_stories stories
  #Double the score for each title with "cat" or "dog" in the title.
  cat_dog(stories)

  stories.sort_by! { |story| story[:score] }

  stories.reverse!

  stories.each do |story|
    # "Title: title, Category: category, Upvotes: score"
    puts "Title: #{story[:title]}, Category: #{story[:category]}, Upvotes: (#{story[:score]})"
  end
end
puts "!!! Welcome to the NEWS API Aggregator !!!"
stories = get_from_reddit + get_from_mashable + get_from_digg
display_stories stories





