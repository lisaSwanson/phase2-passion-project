class Website < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :user

	validates :social_media_link, presence: true

end
