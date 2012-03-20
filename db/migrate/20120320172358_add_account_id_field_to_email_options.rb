class AddAccountIdFieldToEmailOptions < ActiveRecord::Migration
  def change
     add_column :email_options, :account_id, :integer
  end
end
