require_dependency "mkd_philippines/application_controller"

module MkdPhilippines
  class BarangaysController < ApplicationController
    def index
      barangays = MkdPhilippines::Barangay.all
      render json: MkdPhilippines::BarangaysSerializer.new(barangays)
    end

    def show
      barangay = MkdPhilippines::Barangay.find params[:id]
      render json: MkdPhilippines::BarangaysSerializer.new(barangay)
    end
  end
end
