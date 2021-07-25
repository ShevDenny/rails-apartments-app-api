class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show
        apartment = Apartment.find_by(id: params[:id])
        if apartment
            render json: apartment
        else
            render json: { error: "Apartment not found"}, status: :not_found
        end
    end

    def create
        new_apartment = Apartment.create(apartment_params)
        render json: new_apartment
    end

    def destroy
        apartment = Apartment.find_by(id: params[:id])
        apartment.destroy
        render json: { message: "apartment was deleted" }
    end

    def update
        apartment = Apartment.find_by(id: params[:id])
        apartment.update(apartment_params)
        render json: apartment
    end

    private

    def apartment_params
        params.require(:apartment).permit(:number)
    end

end
