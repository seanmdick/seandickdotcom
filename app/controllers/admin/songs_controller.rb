class Admin::SongsController < Admin::AdminController
  def index
    @songs = Song.all
  end
  
  def show
    @song = Song.find(params[:id])
    respond_to do |format|
      format.widget {
        render :partial => '/admin/songs/song', :song => @song
      }
    end
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save!
      render :partial => '/admin/songs/song', :song => @song
    end
  end
end