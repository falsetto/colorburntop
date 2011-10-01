require 'rubygems'
require 'hpricot'
require 'open-uri'
require 'active_support'
require 'color'

class ColorBurnPalette
  include ActiveSupport::CoreExtensions::String::Conversions
  @@beginning = "Jan 4, 2007".to_time
  attr_reader :date
  
  def fetch_palette(date = Time.now)
    date = date.to_s.to_time if !date.is_a? Time
    @date = date
    palette = retrieve_palette_for @date
    parse_xml(palette)
  end
  
  private
  def id_for_date(date)
    (date - @@beginning).to_i/60/60/24
  end
  
  def retrieve_palette_for(date)
    open("http://www.firewheeldesign.com/colorburn/palette/getxml/#{id_for_date(date)}")
  end
  
  def parse_xml(palette)
    doc = Hpricot(palette)
    {:name   =>  (doc/'//root/paletteName').innerHTML, 
     :colors => [(doc/'//root/color1').innerHTML,
                 (doc/'//root/color2').innerHTML,
                 (doc/'//root/color3').innerHTML,
                 (doc/'//root/color4').innerHTML]}
                                                                                                                                # Effects hue as well. Hmmmm....
     # :colors => [{:solid => (doc/'//root/color1').innerHTML, :stroke => Color::RGB.from_html((doc/'//root/color1').innerHTML).adjust_brightness(-20).html.sub(/#/, "")},
     #             (doc/'//root/color2').innerHTML,
     #             (doc/'//root/color3').innerHTML,
     #             (doc/'//root/color4').innerHTML]}
  end
end