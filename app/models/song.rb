class Song < ActiveRecord::Base
  has_many :versions, :class_name => "SongVersion"
end
