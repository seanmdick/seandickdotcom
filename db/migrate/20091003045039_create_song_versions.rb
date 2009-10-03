class CreateSongVersions < ActiveRecord::Migration
  def self.up
    create_table :song_versions do |t|
      t.integer :song_id
      t.text :description
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :song_versions
  end
end
