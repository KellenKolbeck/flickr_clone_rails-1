class AddNameToUserTags < ActiveRecord::Migration
  def change
    add_column :user_tags, :name, :string
  end
end
