class CreateConsumeEmailOptions < ActiveRecord::Migration
  def change
    create_table :consume_email_options do |t|
      t.string :name
      t.string :field

      t.timestamps
    end
  end
end
