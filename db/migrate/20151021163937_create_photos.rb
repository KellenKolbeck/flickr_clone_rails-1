class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.column :author, :string
      t.column :description, :string

      t.timestamps
    end
  end

  def up
    add_attachment :photos, :image
  end

  def down
    remove_attachment :photos, :image
  end

end
