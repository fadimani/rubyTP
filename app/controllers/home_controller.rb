class HomeController < ApplicationController
  def index
    @page_name = 'home'
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
