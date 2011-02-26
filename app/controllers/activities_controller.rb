class ActivitiesController < ApplicationController
  
  def show
    @content = Content.for_symbol(:activities).first
    @pictures = Picture.from_category(:activities)
    @pictures = Picture.random.only_in_gallery.all if @pictures.empty?
  end

end