Factory.define :song do |song|
  song.title "Song #{song.object_id}"
end

Factory.define :song_version do |sv|
  sv.description "this is an original description #{sv.object_id}"
  sv.song {|song| song.association(:song)}
end