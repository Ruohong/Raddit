class Post < ActiveRecord::Base
	has_many :comments
	has_many :categorizations
	has_many :categories, :through => :categorizations
	belongs_to :user
	has_many :votes
end
