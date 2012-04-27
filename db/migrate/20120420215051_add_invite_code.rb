class AddInviteCode < ActiveRecord::Migration
  def up
		add_column :invitations, :invite_code, :string
  end

  def down
  end
end
