class PlaceController < ApplicationController
    def new
        @place = Place.new
    end

    def create
        @place = Place.create(get_params)
        redirect_to root_path
    end

    def get_params
        params.require(:place).permit(:name)
    end
end
