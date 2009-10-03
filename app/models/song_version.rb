class SongVersion < ActiveRecord::Base
  has_one :song
end
