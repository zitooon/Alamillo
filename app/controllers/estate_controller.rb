class EstateController < ApplicationController
  
  def show
    @content = Content.for_symbol(:estate).first
    @pictures = Picture.from_category(:estate)
  end

end