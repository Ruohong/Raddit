class Vote < ActiveRecord::Base
	belongs_to :post
	belongs_to :user
	belongs_to :comment

	validates_uniqueness_of :post_id, :scope => :user_id

end
