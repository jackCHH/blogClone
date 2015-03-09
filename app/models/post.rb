class Post < ActiveRecord::Base
	# let's add some validation to prevent empty posts
	validates :title, presence: true
	validates :body, presence: true
end
