class SharingsController < ApplicationController
  before_action :set_sharing, only: [:show, :edit, :update, :destroy]

  # GET /sharings
  # GET /sharings.json
  def index
    @sharings = Sharing.all
  end

  # GET /sharings/1
  # GET /sharings/1.json
  def show
  end

  # GET /sharings/new
  def new
    @sharing = Sharing.new
  end

  # GET /sharings/1/edit
  def edit
  end

  # POST /sharings
  # POST /sharings.json
  def create
    @sharing = Sharing.new(sharing_params)

    respond_to do |format|
      if @sharing.save
        format.html { redirect_to @sharing, notice: 'Sharing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sharing }
      else
        format.html { render action: 'new' }
        format.json { render json: @sharing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sharings/1
  # PATCH/PUT /sharings/1.json
  def update
    respond_to do |format|
      if @sharing.update(sharing_params)
        format.html { redirect_to @sharing, notice: 'Sharing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sharing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sharings/1
  # DELETE /sharings/1.json
  def destroy
    @sharing.destroy
    respond_to do |format|
      format.html { redirect_to sharings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharing
      @sharing = Sharing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharing_params
      params.require(:sharing).permit(:user_id, :recipient_id, :description, :shareable_id)
    end
end
