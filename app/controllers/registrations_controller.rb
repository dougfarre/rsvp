class RegistrationsController < Devise::RegistrationsController

  def new
		super
  end

  def create
		unless (params[:invite_code].blank? and params[:last_name].blank? and params[:i_id].blank?) 
			begin
				invite = Invitation.find(params[:i_id].to_i)
			rescue
				invite = nil
			end

			if invite.blank?			
				invite = Invitation.where(:invite_code => params[:invite_code]).first
			end

			if invite.blank? 
				if Invitation.where(:last_name => params[:last_name_input]).count > 1			
					redirect_to list_invites_path(:last_name => params[:last_name_input]) and return
				else
					invite = Invitation.where(:last_name => params[:last_name_input]).first
				end
			end

			unless invite.blank?
				session[:is_authenticated] = true
				session[:invitation_id] = invite.id 
				redirect_to invitations_path() 
			else
				redirect_to new_user_registration_path, notice: 'rsvp code/last name not found'
			end
		else
			redirect_to new_user_registration_path, notice: "you did not enter anything" 
		end
  end

	def update
  	super
  end

	def list
		@invites = Invitation.where(:last_name => params[:last_name])			
		render 'list.html.erb'
	end
end 
