json.array!(@stories) do |story|
  json.extract! story, :id, :title, :author, :description
  json.url story_url(story, format: :json)
end
