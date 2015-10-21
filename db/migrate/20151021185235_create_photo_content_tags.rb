class CreatePhotoContentTags < ActiveRecord::Migration
  def change
    create_table :photo_content_tags do |t|
      t.column :photo_id, :integer
      t.column :content_tag_id, :integer

      t.timestamps null: false
    end
  end
end
