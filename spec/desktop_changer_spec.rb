$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'

require 'rubygems'
require 'spec/runner'

require "desktop_changer"

context "The desktop changer class" do
  specify "should accept an image file as an argument and return true when passed 'change'" do
    DesktopChanger.change("/Users/Jed/Development/fun/colorburntop/assets/desktop_20070315.gif").should == true
  end
end