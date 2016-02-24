class RemoveOwnerFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :owner
  end
end
