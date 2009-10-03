class SongVersion < ActiveRecord::Base
  has_one :song
  named_scope :unattached, :conditions => {:song_id => nil}, :order => "created_at DESC"
  named_scope :oldest, :limit => 1, :order => "created_at ASC"
end
