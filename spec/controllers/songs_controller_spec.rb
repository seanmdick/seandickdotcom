require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SongsController do
  context "index" do
    it "should be ok" do
      get :index
      response.should be_success
    end
  end
end
