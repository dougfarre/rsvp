class Giftsent < ActiveRecord::Migration
  def up
		add_column :invitations, :gift, :string
		add_column :invitations, :thank_you, :string
  end

  def down
  end
end
