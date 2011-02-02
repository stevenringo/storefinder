class Admin::StoresController < ApplicationController
  # GET /admin/stores
  # GET /admin/stores.xml
  def index
    @stores = Store.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stores }
    end
  end

  # GET /admin/stores/1
  # GET /admin/stores/1.xml
  def show
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @store }
    end
  end

  # GET /admin/stores/new
  # GET /admin/stores/new.xml
  def new
    @store = Store.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
    end
  end

  # GET /admin/stores/1/edit
  def edit
    @store = Store.find(params[:id])
  end

  # POST /admin/stores
  # POST /admin/stores.xml
  def create
    @store = Store.new(params[:admin_store])

    respond_to do |format|
      if @store.save
        format.html { redirect_to(@store, :notice => 'Store was successfully created.') }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/stores/1
  # PUT /admin/stores/1.xml
  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(params[:admin_store])
        format.html { redirect_to(@store, :notice => 'Store was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/stores/1
  # DELETE /admin/stores/1.xml
  def destroy
    @admin_store = Store.find(params[:id])
    @admin_store.destroy

    respond_to do |format|
      format.html { redirect_to(admin_stores_url) }
      format.xml  { head :ok }
    end
  end
end
