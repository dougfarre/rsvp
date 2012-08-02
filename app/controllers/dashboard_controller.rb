class DashboardController < ApplicationController
	before_filter :authenticate_admin!

	def main
		#@invitations = Invitation.find(:all)
		#@new_invitation = Invitation.new
		redirect_to admin_index_path
	end

end
