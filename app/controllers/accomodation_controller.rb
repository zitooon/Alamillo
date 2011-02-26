class AccomodationController < ApplicationController

  private
  def generic(sym)
    @content = Content.for_symbol(sym).first
    @pictures = Picture.from_category(sym)
    render :action => :show  
  end

  public
  def show
    generic(:accommodation)
  end

  def blue_suite
    generic(:blue_suite)
  end

  def tennis_house      
    generic(:tennis_house)
  end

  def main_house
    generic(:main_house)
  end

end