class CreatePhotoUserTags < ActiveRecord::Migration
  def change
    create_table :photo_user_tags do |t|
      t.column :photo_id, :integer
      t.column :user_tag_id, :integer

      t.timestamps null: false
    end
  end
end
