class HomeController < ApplicationController
  def index
    @page_name = 'home'
    @article = utilisateur_courant.articles.build if logged_in?
  end

  def about
    @page_name = 'about'
  end

  def aide
    @page_name = 'aide'
  end

  def contact
    @page_name = 'contact'
  end
end
