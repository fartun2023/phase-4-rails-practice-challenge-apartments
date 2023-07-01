class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destroy]

  # GET /apartments
  def index
    @apartments = Apartment.all
    render json: @apartments
  end

  # GET /apartments/:id
  def show
    render json: @apartment
  end

  # POST /apartments
  def create
    @apartment = Apartment.new(apartment_params)
    if @apartment.save
      render json: @apartment, status: :created
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # PATCH /apartments/:id
  def update
    if @apartment.update(apartment_params)
      render json: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apartments/:id
  def destroy
    @apartment.destroy
    head :no_content
  end

  private

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end

  def apartment_params
    params.require(:apartment).permit(:number)
  end
end
