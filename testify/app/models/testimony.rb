class Testimony < ActiveRecord::Base
  require 'carrierwave'
   mount_uploader :picture, AvatarUploader
   belongs_to :user
   has_many :comments, dependent: :destroy
end
