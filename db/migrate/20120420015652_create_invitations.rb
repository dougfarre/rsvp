class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :last_name
      t.string :first_names
      t.integer :spots
      t.string :login_message
      t.string :feedback

      t.timestamps
    end
  end
end
