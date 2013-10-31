class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.text :text
      t.boolean :flagged
      t.timestamp
    end
  end

  def down
    drop_table :comments
  end
end
