require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongVersion do
  it "should belong to a song" do
    song_version = Factory :song_version
    song_version.song.should be_kind_of Song
  end
end
