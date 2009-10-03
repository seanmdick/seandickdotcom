module SongsHelper

  def player(url, options = {})
    @player_id ||= 0
    @player_id += 1
    height = options[:height] || 24
    width = options[:width] || 290
    """
<object width=\"#{width}\" height=\"#{height}\" id=\"audioplayer#{@player_id}\" data=\"/flash/player.swf\" type=\"application/x-shockwave-flash\"><param value=\"/flash/player.swf\" name=\"movie\"/><param value=\"playerID=#{@player_id}&amp;bg=0xccccdd&amp;leftbg=0xeeeeff&amp;lefticon=0x6666aa&amp;rightbg=0xdedeef&amp;rightbghover=0x9999aa&amp;righticon=0x666688&amp;righticonhover=0xeeeeff&amp;text=0xaa6666&amp;slider=0x666688&amp;track=0xFFFFFF&amp;border=0x666666&amp;loader=0xccccff&amp;soundFile=#{h url}\" name=\"FlashVars\"/><param value=\"high\" name=\"quality\"/><param value=\"false\" name=\"menu\"/><param value=\"#C0C0C0\" name=\"bgcolor\"/></object>
    """
  end
end
