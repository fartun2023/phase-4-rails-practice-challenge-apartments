class LeasesController < ApplicationController
    before_action :set_lease, only: [:show, :destroy]

    # GET /leases
    def index
      @leases = Lease.all
      render json: @leases
    end
  
    # GET /leases/:id
    def show
      render json: @lease
    end
  
    # POST /leases
    def create
      @lease = Lease.new(lease_params)
      if @lease.save
        render json: @lease, status: :created
      else
        render json: @lease.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /leases/:id
    def destroy
      @lease.destroy
      head :no_content
    end
  
    private
  
    def set_lease
      @lease = Lease.find(params[:id])
    end
  
    def lease_params
      params.require(:lease).permit(:rent, :apartment_id, :tenant_id)
    end
end
