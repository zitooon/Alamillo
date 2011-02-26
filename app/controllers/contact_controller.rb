class ContactController < ApplicationController
  
  def show
    @content = Content.for_symbol(:contact).first
    @pictures = Picture.random.only_in_gallery.all
  end

end