class Admin::AdminController < ApplicationController
  include SongsHelper
  include AuthenticatedSystem
  before_filter :authenticated?
  
  def authenticated?
    if !logged_in?
      redirect_to login_path
      false
    end 
  end
end