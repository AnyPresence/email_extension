class CreateNotifiers < ActiveRecord::Migration
  def change
    create_table :notifiers do |t|

      t.timestamps
    end
  end
end
