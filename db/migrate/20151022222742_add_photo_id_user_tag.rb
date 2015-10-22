class AddPhotoIdUserTag < ActiveRecord::Migration
  def change
    add_column :user_tags, :photo_id, :integer
  end
end
