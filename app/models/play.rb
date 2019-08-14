class Play < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :reviews

	has_attached_file :play_img,
	                  styles: { play_index: '250x350>', play_show: '325x475>' },
	                  default_url: '/images/:style/missing.png'
	validates_attachment_content_type :play_img, content_type: %r{\Aimage\/.*\z}
end

class Friend < ActiveRecord::Base
	# This method associates the attribute ":avatar" with a file attachment
	has_attached_file :avatar,
	                  styles: {
			thumb: '100x100>', square: '200x200#', medium: '300x300>'
	                  }

	# Validate the attached image is image/jpg, image/png, etc
	validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}
end
