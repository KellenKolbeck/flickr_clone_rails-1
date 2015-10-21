class UserTag < ActiveRecord::Base
  has_many :photos, through: :photo_user_tag
end
