class Photo < ActiveRecord::Base
  validates :author, presence: true
  validates :description, presence: true

  has_many :photo_content_tags
  has_many :content_tags, through: :photo_content_tags
  has_many :comments

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
