class UserTag < ActiveRecord::Base

  has_many :photo_user_tags
  has_many :photos, through: :photo_user_tag
end
