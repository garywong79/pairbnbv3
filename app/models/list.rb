class List < ActiveRecord::Base


belongs_to :user
has_many :reservations, dependent: :destroy
mount_uploaders :images, ImageUploader

validates :price, :bathroom, :bedroom, :bed, :property_type, :room_type, presence: true

# searchkick

end
