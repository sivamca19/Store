class StoreModulesController < ApplicationController
  # GET /store_modules
  # GET /store_modules.json
  def index
    @store_modules = StoreModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @store_modules }
    end
  end

  # GET /store_modules/1
  # GET /store_modules/1.json
  def show
    @store_module = StoreModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @store_module }
    end
  end

  # GET /store_modules/new
  # GET /store_modules/new.json
  def new
    @store_module = StoreModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @store_module }
    end
  end

  # GET /store_modules/1/edit
  def edit
    @store_module = StoreModule.find(params[:id])
  end

  # POST /store_modules
  # POST /store_modules.json
  def create
    @store_module = StoreModule.new(params[:store_module])

    respond_to do |format|
      if @store_module.save
        format.html { redirect_to store_modules_path, notice: 'Store module was successfully created.' }
        format.json { render json: @store_module, status: :created, location: @store_module }
      else
        format.html { render action: "new" }
        format.json { render json: @store_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /store_modules/1
  # PUT /store_modules/1.json
  def update
    @store_module = StoreModule.find(params[:id])

    respond_to do |format|
      if @store_module.update_attributes(params[:store_module])
        format.html { redirect_to store_modules_path, notice: 'Store module was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @store_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store_modules/1
  # DELETE /store_modules/1.json
  def destroy
    @store_module = StoreModule.find(params[:id])
    @store_module.destroy

    respond_to do |format|
      format.html { redirect_to store_modules_url }
      format.json { head :no_content }
    end
  end
end
