class AddImageUrlToSongVersion < ActiveRecord::Migration
  def self.up
    add_column :song_versions, :image_url, :string
  end

  def self.down
    remove_column :song_versions, :image_url
  end
end
