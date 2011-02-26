class ServicesController < ApplicationController

  def show
    @content = Content.for_symbol(:services).first
    @pictures = Picture.from_category(:services)
    @pictures = Picture.random.only_in_gallery.all if @pictures.empty?
  end

end