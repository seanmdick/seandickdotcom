require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  before(:each) do
    @valid_attributes = {
      
    }
  end
  context "associations" do
    it "should have many versions" do
      Song.new.should respond_to(:versions)
    end
  end
end
