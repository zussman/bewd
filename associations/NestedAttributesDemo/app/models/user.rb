class User < ActiveRecord::Base
	has_one :address
	validates_presence_of :email

	has_many :tasks

	accepts_nested_attributes_for :tasks,
		:allow_destroy => true,
		:reject_if => :all_blank

	has_many :interest_users
	has_many :interests, :through => :interest_users

	accepts_nested_attributes_for :interest_users,
		:allow_destroy => true
end
