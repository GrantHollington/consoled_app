class HomeController < ApplicationController
  def page
    #variable which contains all the listings
    @listings =  Listing.all
  end
end
