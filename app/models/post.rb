class Post < ApplicationRecord
	mount_uploader :photo, PhotoUploader
	belongs_to :user
	validates :user_id , :photo , :description, presence: true
end
