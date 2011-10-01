$LOAD_PATH.unshift File.dirname(__FILE__) + '/../lib'
require 'rubygems'
require 'spec/runner'

require 'color_burn_palette'

context "An instance of ColorBurnPalette" do
  setup do
    @color_burn_palette = ColorBurnPalette.new
  end
  specify "should return a hash with name and color attributes when sent 'parse' with 3/3/07" do
    @color_burn_palette.fetch_palette("3/13/07").should == {:name => "Erudite Sunshine", :colors => %w(096cbd 056251 e5c37e cc5500)}
  end
  
  specify "should return a hash when sent 'parse' with no arguments" do
    @color_burn_palette.fetch_palette.should be_an_instance_of(Hash)
  end
end