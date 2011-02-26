class IntroductionController < ApplicationController

  def show
    @content = Content.for_symbol(:introduction).first
    @pictures = Picture.from_category(:introduction)
  end
  
end
