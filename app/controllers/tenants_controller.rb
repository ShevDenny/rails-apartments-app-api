class TenantsController < ApplicationController
    def index
        tenants = Tenant.all
        render json: tenants
    end

    def create
        new_tenant = Tenant.create(tenant_params)
        render json: new_tenant
    end

    def destroy
        tenant = Tenant.find_by(:id params[:id])
        tenant.destroy
        render json: {message: "Tenant was deleted"}
    end
    
    def update
        tenant = Tenant.find_by(:id params[:id])
        tenant.update(tenant_params)
    end

    private

    def tenant_params
        params.require(:tenant).permit(:name, :age)
    end
end
