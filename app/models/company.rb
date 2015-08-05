class Company < ActiveRecord::Base
  has_many :reviews
  mount_uploader :picture, PictureUploader
end
