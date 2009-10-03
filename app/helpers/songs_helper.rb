module SongsHelper
  def player(url)
    """
<object width=\"290\" height=\"24\" id=\"audioplayer1\" data=\"/flash/player.swf\" type=\"application/x-shockwave-flash\"><param value=\"/flash/player.swf\" name=\"movie\"/><param value=\"playerID=1&amp;bg=0xccccdd&amp;leftbg=0xeeeeff&amp;lefticon=0x6666aa&amp;rightbg=0xdedeef&amp;rightbghover=0x9999aa&amp;righticon=0x666688&amp;righticonhover=0xeeeeff&amp;text=0xaa6666&amp;slider=0x666688&amp;track=0xFFFFFF&amp;border=0x666666&amp;loader=0xccccff&amp;soundFile=#{h url}\" name=\"FlashVars\"/><param value=\"high\" name=\"quality\"/><param value=\"false\" name=\"menu\"/><param value=\"#FFFFFF\" name=\"bgcolor\"/></object>
    """
  end
end
