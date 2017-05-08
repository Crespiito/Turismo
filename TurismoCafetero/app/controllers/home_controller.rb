class HomeController < ApplicationController

  def index
  end

  def destroy
  	session.delete(:email)
  	session.delete(:admin)
  	session.delete(:sus)
  	session.delete(:root)
  end

end
