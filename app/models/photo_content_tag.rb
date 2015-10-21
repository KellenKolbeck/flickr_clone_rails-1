class PhotoContentTag < ActiveRecord::Base
  belongs_to :photo
  belongs_to :content_tag
end
