class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.column :photo_id, :integer

      t.timestamps
    end
  end
end
