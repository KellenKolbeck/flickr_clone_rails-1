class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.column :content, :string
      t.belongs_to :photo

      t.timestamps
    end
  end
end
