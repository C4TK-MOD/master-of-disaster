class PhysicalAssetsController < ApplicationController
  # GET /physical_assets
  # GET /physical_assets.json
  def index
    @physical_assets = PhysicalAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @physical_assets }
    end
  end

  # GET /physical_assets/1
  # GET /physical_assets/1.json
  def show
    @physical_asset = PhysicalAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @physical_asset }
    end
  end

  # GET /physical_assets/new
  # GET /physical_assets/new.json
  def new
    @physical_asset = PhysicalAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @physical_asset }
    end
  end

  # GET /physical_assets/1/edit
  def edit
    @physical_asset = PhysicalAsset.find(params[:id])
  end

  # POST /physical_assets
  # POST /physical_assets.json
  def create
    @physical_asset = PhysicalAsset.new(params[:physical_asset])

    respond_to do |format|
      if @physical_asset.save
        format.html { redirect_to @physical_asset, notice: 'Physical asset was successfully created.' }
        format.json { render json: @physical_asset, status: :created, location: @physical_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @physical_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /physical_assets/1
  # PUT /physical_assets/1.json
  def update
    @physical_asset = PhysicalAsset.find(params[:id])

    respond_to do |format|
      if @physical_asset.update_attributes(params[:physical_asset])
        format.html { redirect_to @physical_asset, notice: 'Physical asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @physical_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physical_assets/1
  # DELETE /physical_assets/1.json
  def destroy
    @physical_asset = PhysicalAsset.find(params[:id])
    @physical_asset.destroy

    respond_to do |format|
      format.html { redirect_to physical_assets_url }
      format.json { head :no_content }
    end
  end
end
