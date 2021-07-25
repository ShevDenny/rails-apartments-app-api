class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments
    end

    def create
        new_apartment = Apartment.create(apartment_params)
        render json: new_apartment
    end

    def destroy
        apartment = Apartment.find_by(:id params[:id])
        apartment.destroy
        render json: apartment
    end

    def update
        apartment = Apartment.find_by(:id params[:id])
        apartment.update(apartment_params)
    end

    private

    def apartment_params
        params.require(:apartment).permit(:number)
    end
end
