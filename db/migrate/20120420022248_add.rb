class Add < ActiveRecord::Migration
  def up
		add_column :addresses, :invitation_id, :integer
  end

  def down
  end
end
