class VolunteersController < ApplicationController
  def create
    volunteer = Volunteer.new(volunteer_params)
    if volunteer.save
      render json: {status: "Success", message: "Saved"}, status: :created
    else
      render json: {status: "error", message: volunteer.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def volunteer_params
    params.require(:volunteer).permit(:firstname, :lastname, :email, :contact, :occupation, :message)
  end
end
