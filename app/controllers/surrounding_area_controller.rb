class SurroundingAreaController < ApplicationController
  
  def show
    @content = Content.for_symbol(:surrounding_area).first
    @pictures = Picture.from_category(:surrounding_area)
    @pictures = Picture.random.only_in_gallery.all if @pictures.empty?
  end

end