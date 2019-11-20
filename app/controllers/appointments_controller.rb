class AppointmentsController < ApplicationController
  before_action :set_hospital

  def index
    @Docters = @hospital.appointments.where(role: 'Docter')
    @Nurses = @hospital.appointments.where(role: 'Nurse')
    @Patient= @hospital.appointments.where(role: 'Patient')

  end

  def new
    @patient = Patient.all - @hospital.patient
    @appointment = @hospital.appointments.new
  end

  def create
    @appointment = @hospital.appointments.new(appointment_params)
    if @appointment.save
      redirect_to hospital_appointment_path(@hospital)
    else
      render :new
    end
  end

  def destroy
    @appointment = @hospital.appointments.find(params[:id])
    @appointment.destroy
    redirect_to hospital_appointment_path(@course)
  end

  private 
  def set_hospital
    @hospital = Hospital.find(params[:hospital_id]) 
  end

  def appointment_params
    params.require(:appointment).permit(:role, :Patient_id)
  end
end
