class Admin::SongVersionsController < Admin::AdminController
  # def show
  #   redirect_to admin_songs_path
  # end
  
  def update
    version = SongVersion.find(params[:id])
    version.update_attributes(params[:song_version])
    render :json => version
  end
  
  def destroy
    SongVersion.find(params[:id]).destroy
    render :text => " ", :status => 200
  end
end