class Invitation < ActiveRecord::Base
	has_one :address
	belongs_to :admin
	accepts_nested_attributes_for :address
	before_validation :generate_code
	validates_uniqueness_of :invite_code
	validates_presence_of :invite_code, :first_names, :last_name, :spots, :rsvp_number	

	def self.get_reports
		reports = Hash.new
		reports['spots'] = Invitation.sum(:spots)
		reports['rsvp'] = Invitation.sum(:rsvp_number)
		reports['owner_hash'] = Invitation.owner_hash

		return reports
	end

	
	def self.owner_hash
		unique_owners = Admin.all
		owner_hash = Hash.new
		unless unique_owners.blank?
			unique_owners.each do |unique_owner|
				owner_hash[unique_owner.email] = Invitation.where(:admin_id => unique_owner.id).sum(:spots)
			end
		end

		return owner_hash
	end

	def self.search(search)
	  if search
	   	where('last_name LIKE ?', "%#{search}%")
	  else
	    scoped
  	end
	end


	def generate_code
		if self.invite_code.blank?
			self.invite_code = 'l' + rand(9).to_s + 'o' + rand(9).to_s + 'v' + rand(9).to_s + 'e' 
		end
	end

	def change_address(params)
		if self.address.blank?
			self.build_address
		end

		self.address.attributes = params
	end

	def make_errors
		errors = ""
		self.errors.full_messages.each do |msg|
			errors = errors + ' - ' + msg
		end

		return errors
	end
end
