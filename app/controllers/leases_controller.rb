class LeasesController < ApplicationController
    def create
        new_lease = Lease.create(lease_params)
        render json: new_lease
    end

    def destroy
        lease = Lease.find_by(id: params[:id])
        lease.destroy
    end

    private

    def lease_params
        params.require(:lease).permit(:apartment_id, :tenant_id, :rent)
    end
end
