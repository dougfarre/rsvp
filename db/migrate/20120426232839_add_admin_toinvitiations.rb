class AddAdminToinvitiations < ActiveRecord::Migration
  def up
		add_column :invitations, :admin_id, :integer
  end

  def down
  end
end
