class GastronomyController < ApplicationController
  
  def show
    @content = Content.for_symbol(:gastronomy).first
    @pictures = Picture.from_category(:gastronomy)
  end

end