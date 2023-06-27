class DropMembers < ActiveRecord::Migration[6.1]
  def change
    drop_table :members
  end
end
