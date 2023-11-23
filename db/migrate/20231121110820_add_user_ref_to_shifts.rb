class AddUserRefToShifts < ActiveRecord::Migration[7.1]
  def change
    add_reference :shifts, :user, foreign_key: true, index: true, null: false
  end
end
