class RegistrationsController < Devise::RegistrationsController

  def new
		super
  end

  def create
		invite_code = params[:invite_code]			
		
		unless invite_code.blank?
			invitation = Invitation.where(:invite_code => invite_code).first

			unless invitation.blank?
				session[:is_authenticated] = true
				session[:invitation_id] = invitation.id 
				redirect_to invitations_path() 
			else
				redirect_to new_user_registration_path, notice: 'rsvp code not found'
			end
		else
			redirect_to new_user_registration_path, notice: "you did not enter anything" 
		end
  end

	def update
  	super
  end
end 
