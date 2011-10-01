$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'spec/runner'

require "palette_image_generator"

context "An instance of the desktop generator class" do
  setup do
    @generator = PaletteImageGenerator.new
  end
  
  specify "should return the filename of a new gif image (that includes today's date) when passed 'generate' without any arguments" do
    @generator.generate.should == "desktop_#{Time.now.strftime("%Y%m%d")}.gif"
  end
  
  specify "should return the filename of a new gif image (that includes the passed date) when passed 'generate' without a date (string) argument" do
    @generator.generate("3/15/07").should == "desktop_20070315.gif"
  end
  
  specify "should raise ArgumentError when passed 'generate' with an unparseable date argument" do
    lambda { @generator.generate("gardenening tools") }.should raise(ArgumentError)
  end
end