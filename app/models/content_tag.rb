class ContentTag < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :photo_content_tags
  has_many :photos, through: :photo_content_tags

end
