require 'rvg/rvg'
require 'rubygems'
require 'active_support'

# Concerns

class PaletteImageGenerator
  include Magick
  include ActiveSupport::CoreExtensions::String::Conversions
  RVG::dpi = 72
  
  def generate(palette, date = Time.now)
    date = date.to_s.to_time if !date.is_a? Time
    viewport_width = 2460
    viewport_height = 1500
    square_margin_right = 50
    square_width = (viewport_width-(3*square_margin_right))/4 
    
    image = RVG.new(2560, 1600) do |canvas|
      canvas.background_fill = 'black'
      
      colors = Magick::RVG::Group.new do |squares|
        0.upto(3) do |num|
          squares.rect(square_width, viewport_height, (num*(square_width+square_margin_right))+square_margin_right, 50).styles(:fill => "##{palette[:colors][num]}")
        end
      end
      
      canvas.use(colors)
    end
    path = File.join(File.dirname(__FILE__), "../desktops", "desktop_#{date.strftime("%Y%m%d")}.gif")
    image.draw.write(path)
    path
  end
end