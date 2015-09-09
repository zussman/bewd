# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
utility_list = [ 'Pepco', 'BGE', 'Potomac Edison', 'SMECO', 'Dominion' ]
phone_type_list = ['Main','Cell','Work','Fax','Other']


utility_list.each do |name|
  Utility.create( name: name)
end

phone_type_list.each do |name|
  PhoneType.create( name: name)
end