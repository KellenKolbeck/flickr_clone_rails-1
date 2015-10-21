class AddNameToContentTags < ActiveRecord::Migration
  def change
    add_column :content_tags, :name, :string
  end
end
