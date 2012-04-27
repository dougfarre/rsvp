class Address < ActiveRecord::Base
	belongs_to :invitation
	validates_presence_of :street, :city, :state, :zip, :cell, :email 
end
