class WelcomeController < ApplicationController
  def index
  end
  def search
    @search = PgSearch.multisearch(params[:search])
  end
end
