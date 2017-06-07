class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]
  def index
    @doctors = Doctor.all
  end

  def new
    @doctors = Doctor.new
  end

  def show
  end

  def edit
  end

  def create_table
    @doctors = Doctor.find(doctor_params)

    if @doctors.save
      redirect_to @doctor, notice: 'Doctor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @doctor.update(doctor_params)
      redirect_to @doctor, notice: 'Doctor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_url, notice: 'Doctor was successfully deleted.'
  end

  private

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :description)
    end
end
