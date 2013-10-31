class CreateTracks < ActiveRecord::Migration
  def up
    create_table :tracks do |t|
      t.string :title
      t.string :release_date
      t.string :audio
    end
  end

  def down
    drop_table :tracks
  end
end
