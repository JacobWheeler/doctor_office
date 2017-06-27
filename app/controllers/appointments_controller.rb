class AppointmentsController < ApplicationController
  def new
    @doctors = Doctor.all.map { |d| [d.name, d.id] }
    @patients = Patient.all.map { |t| [t.name, t.id]  }
    @appointment = Appointment.new
  end

  def index
    @appointments = Appointment.all
  end

  def create
   @appointment = Appointment.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    flash[:success] = 'Appointment Deleted!'
    redirect_to doctor_path(appointment.doctor_id)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id)

  end

end
