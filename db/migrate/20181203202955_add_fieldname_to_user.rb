class AddFieldnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fieldname, :string
  end
end
