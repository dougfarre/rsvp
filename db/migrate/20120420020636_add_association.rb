class AddAssociation < ActiveRecord::Migration
  def up
		#add_column :addresses, :invitation_id, :integer
		remove_column :invitations, :address_id
  end

  def down
  end
end
