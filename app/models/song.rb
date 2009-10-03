class Song < ActiveRecord::Base
  has_many :versions, :class_name => "SongVersion", :dependent => :destroy, :order => "created_at DESC"
  validates_presence_of :title
  
  def oldest_date
    unless versions.blank?
      versions.oldest.last.created_at 
    else
      10.years.ago
    end
  end
  
  def <=>(other)
    other.oldest_date <=> oldest_date
  end
end
