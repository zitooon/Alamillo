class ContentsController < ApplicationController

  %w(introduction activities gastronomy contact estate services surroundings surrounding_area).each do |r|
    r = r.to_sym
    define_method(r) do
      @sym_for_menu = r
      @content = Content.for_symbol(r).first
      @pictures = Picture.from_category(r)
      @pictures = Picture.random.only_in_gallery.all if @pictures.empty?
      render :action => "show"
    end
  end

end