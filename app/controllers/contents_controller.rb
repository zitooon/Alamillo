# encoding: utf-8
class ContentsController < ApplicationController

  Content.find(:all, :group => :symbol).each do |content|
    r = content.symbol.to_sym
    define_method(r) do
      @content = Content.for_symbol(r).first
      @pictures = Picture.from_category(r)
      @pictures = Picture.random.only_in_gallery.all if @pictures.empty?
      render :action => "show"
    end
  end

end