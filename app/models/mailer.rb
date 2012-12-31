class Mailer < ActionMailer::Base
	include SendGrid
	sendgrid_enable :ganalytics, :opentrack
  default :from => "Farre & Shaffer Family <farre_shaffer_family@do_not_reply.net>"
  
  def save_the_date(invitation)
		email = invitation.email

		@invitation = invitation

		if email.blank?
			email = invitation.address.email
		end
		
    mail( :to => email, :subject => "Wedding notice, save the date!" ) do |format|	
			format.html
		end	
		
		puts "email sent to " + email + "test test test test"
	end
end
