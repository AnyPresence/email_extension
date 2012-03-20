class AddEmailFromStringToAnypresenceExtensionAccount < ActiveRecord::Migration
  def change
     add_column :anypresence_extension_accounts, :email_from, :string
  end
end
