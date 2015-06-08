class MashableApiAggregator # Best practice to name your file the same as your class. 
  # Obviously, one is snake_case and the other is CamelCase, 
  # so the convention is for your file to be snake_case and your class name to be CamelCase.

  def self.fetch_stories!
    response = JSON.load(RestClient.get('http://mashable.com/stories.json'))
  end
end