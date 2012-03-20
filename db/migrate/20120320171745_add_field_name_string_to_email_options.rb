class AddFieldNameStringToEmailOptions < ActiveRecord::Migration
  def change
    add_column :email_options, :name, :string
  end
end
