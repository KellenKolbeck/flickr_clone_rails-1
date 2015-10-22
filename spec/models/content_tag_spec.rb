require 'rails_helper'

RSpec.describe ContentTag, type: :model do
  it { should validate_presence_of :name }
  it { should have_many(:photos).through(:photo_content_tags) }

end
