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
    end
  end
end
