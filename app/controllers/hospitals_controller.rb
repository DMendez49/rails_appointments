
class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :destroy]

  def index
    @hospitals = Hospital.all
  end

  def show
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.create(hospital_params)

    if @hospital.save 
      redirect_to @hospital
    else
      render :new
    end
  end

  def destroy
    @hospital.destroy
    redirect_to hospitals_path
  end
  
  private
  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:name)
  end
end
