json.array!(@houses) do |house|
  json.extract! house, :id, :square_footage, :utility, :address, :email, :notes
  json.url house_url(house, format: :json)
end
