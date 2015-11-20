class Booking < ActiveRecord::Base
	belongs_to :user
	belongs_to :list

	validates :date, :detail, presence: true

end
