class RemoveUsersFromServiceQuantity < ActiveRecord::Migration[5.2]
  def change
    remove_reference :service_quantities, :user, foreign_key: true
  end
end
