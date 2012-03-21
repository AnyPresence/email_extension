class AddColumnAccountIdIntegerToConsumeEmailOptions < ActiveRecord::Migration
  def change
    add_column :consume_email_options, :account_id, :integer
  end
end
