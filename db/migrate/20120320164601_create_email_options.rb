class CreateEmailOptions < ActiveRecord::Migration
  def change
    create_table :email_options do |t|
      t.string :subject
      t.string :to_address
      t.string :body
      t.string :from_address

      t.timestamps
    end
  end
end
