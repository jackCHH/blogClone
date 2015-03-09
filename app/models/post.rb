class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	# let's add some validation to prevent empty posts
	validates :title, presence: true
	validates :body, presence: true

end
