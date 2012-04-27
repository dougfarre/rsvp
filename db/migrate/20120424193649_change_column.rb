class ChangeColumn < ActiveRecord::Migration
  def up
		change_column :invitations, :thank_you, :boolean, :default => false
  end

  def down
  end
end
