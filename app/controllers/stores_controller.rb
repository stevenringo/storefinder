class StoresController < ApplicationController
  # GET /stores
  # GET /stores.xml
  def index
    respond_to do |format|
      format.html do
        @stores = Store.all
      end
      format.xml do
        search_lng = params[:lng]
        search_lat = params[:lat]
        distance   = params[:distance]
        @stores = Store.within(distance,:units => :kms, :origin => [search_lat, search_lng])
      end
      format.json do
        search_lng = params[:lng]
        search_lat = params[:lat]
        distance   = params[:distance]
        product    = params[:product].to_i
        selector   = Store.select('products.*, stores.*').
                     within(distance, :units => :kms, :origin => [search_lat, search_lng]).
                     joins(:products)
        selector = selector.where(:products => {:id => product}) unless product == 0
        @stores = selector
        render :json => @stores.to_json(:methods => "address",
                                        :only => ["lat", "lng", "distance", "name"]), 
               :callback => params[:callback]
      end
    end
  end
end
