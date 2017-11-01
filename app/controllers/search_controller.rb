class SearchController < ApplicationController
  def index
    @stores = Store.zip_search(params[:search])
    @total = Store.total_stores(params[:search])
  end
end
