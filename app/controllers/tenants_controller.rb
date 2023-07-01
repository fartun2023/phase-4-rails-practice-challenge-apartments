class TenantsController < ApplicationController
    before_action :set_tenant, only: [:show, :update, :destroy]

    # GET /tenants
    def index
      @tenants = Tenant.all
      render json: @tenants
    end
  
    # GET /tenants/:id
    def show
      render json: @tenant
    end
  
    # POST /tenants
    def create
      @tenant = Tenant.new(tenant_params)
      if @tenant.save
        render json: @tenant, status: :created
      else
        render json: @tenant.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH /tenants/:id
    def update
      if @tenant.update(tenant_params)
        render json: @tenant
      else
        render json: @tenant.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /tenants/:id
    def destroy
      @tenant.destroy
      head :no_content
    end
  
    private
  
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end
  
    def tenant_params
      params.require(:tenant).permit(:name, :age)
  end
end
