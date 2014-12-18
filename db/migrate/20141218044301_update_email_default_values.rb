class UpdateEmailDefaultValues < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :null => false, :default => ''
  end
end
