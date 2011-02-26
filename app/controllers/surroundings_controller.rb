class SurroundingsController < ApplicationController

  def show
    @content = Content.for_symbol(:surroundings).first
    @pictures = Picture.from_category(:surroundings)
  end

end