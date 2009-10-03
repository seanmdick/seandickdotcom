class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.timestamps
      t.string :title
    end
  end

  def self.down
    drop_table :songs
  end
end
