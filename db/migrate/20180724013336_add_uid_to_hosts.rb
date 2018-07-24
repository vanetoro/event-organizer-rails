class AddUidToHosts < ActiveRecord::Migration[5.2]
  def change
    add_column :hosts, :uid, :string
  end
end
