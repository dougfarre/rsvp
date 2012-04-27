class Sportsnumber < ActiveRecord::Migration
  def up
		add_column :invitations, :rsvp_number, :integer, :default => 0
  end

  def down
  end
end
