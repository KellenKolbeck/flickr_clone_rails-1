class PhotoUserTag < ActiveRecord::Base
  belongs_to :photo
  belongs_to :user_tag
end
