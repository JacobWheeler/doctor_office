class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  def index
    @patients = Patient.all
  end

  def new
    @patients = Patient.new
  end

  def show
  end

  def edit
  end

  def create_table
    @patients = Patient.find(patient_params)

    if @patients.save
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: 'Patient was successfully deleted.'
  end

  private

    def set_Patient
      @patient = Patient.find(params[:id])
    end

    def Patient_params
      params.require(:patient).permit(:name, :description)
    end
end
