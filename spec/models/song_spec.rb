require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Song do
  before :each do
    @song = Factory :song
    @one_year = 1.year.ago
    @one_month = 1.month.ago
    @one_day = 1.day.ago
    @song.versions.create(:created_at => @one_year)
    @song.versions.create(:created_at => @one_month)
    @song.versions.create(:created_at => @one_day)
  end
  context "associations" do
    it "should have many versions" do
      @song.versions.size.should == 3
    end
  end
  
  context "methods" do
    describe "#oldest_date" do
      it "should return the oldest version's date" do
        @song.oldest_date.to_s.should == @one_year.to_s
      end
    end
  end
end
