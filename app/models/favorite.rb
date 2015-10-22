class Favorite < ActiveRecord::Base
  validates :photo_id, presence: true
  belongs_to :user
    
end
