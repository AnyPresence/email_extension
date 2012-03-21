class RenameColumnFieldToConsumeEmailOptions < ActiveRecord::Migration
  def change
    rename_column :consume_email_options, :field, :body_map
  end
end
