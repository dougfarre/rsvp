class Addemailtoinvitiations < ActiveRecord::Migration
  def up
				#remove_column :invitations, :email
				#execute "Alter Table invitations DROP COLUMN email"
				add_column :invitations, :email, :string
  end

  def down
  end
end
