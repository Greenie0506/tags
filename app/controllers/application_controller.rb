class ApplicationController < ActionController::Base
  protect_from_forgery

  def self.tagged_with
    @articles = Article.tagged(params[:tag]).paginate(default_paginate_options)
  end

end
