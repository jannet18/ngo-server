class VolunteersController < ApplicationController
  def create
    volunteer = Volunteer.new(volunteer_params)
    if volunteer.save
      render json: {status: "Thank you for registering as a volunteer. We will contact you soon.", message: "Saved"}, status: :created
    else
      render json: {status: "error", message: volunteer.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:fullname, :email, :contact, :area_of_interest, :church, :message)
  end
end
