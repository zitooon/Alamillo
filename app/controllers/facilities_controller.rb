class FacilitiesController < ApplicationController

  private
  def generic(sym)
    @content = Content.for_symbol(sym).first
    @pictures = Picture.from_category(sym)
    render :action => :show  
  end

  public
  def show
    redirect_to meeting_room_facilities_path
  end
  
  def meeting_room 
    generic(:meeting_room)
  end

  def garden
    generic(:garden)
  end

  def gym_spa
    generic(:gym_spa)
  end

  def games_room
    generic(:games_room)
  end

end