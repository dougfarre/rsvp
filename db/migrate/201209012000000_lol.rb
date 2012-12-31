class Lol < ActiveRecord::Migration
  def up
				#remove_column :invitations, :email
				#execute "Alter Table invitations DROP COLUMN email"
				remove_column :invitations, :test
				add_column :invitations, :save_the_date_sent, :boolean
				add_column :invitations, :invitation_sent, :boolean
  end

  def down
  end
end
