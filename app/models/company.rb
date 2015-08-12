class Company < ActiveRecord::Base
  has_many :reviews
  has_many :positions
  mount_uploader :picture, PictureUploader
  has_permalink :name
end
