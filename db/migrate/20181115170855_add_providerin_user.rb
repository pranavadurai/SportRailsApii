class AddProviderinUser < ActiveRecord::Migration[5.2]
  def change
      add_column :users, :provider, :string 
  end
end
