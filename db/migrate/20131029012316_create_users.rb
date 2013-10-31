class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.text :image
      t.string :role
      t.string :email
      t.string :password_digest
      t.string :genre
      t.text :about
      t.text :css
    end
  end

  def down
    drop_table :users
  end
end
