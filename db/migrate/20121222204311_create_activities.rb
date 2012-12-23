class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.text :message

      t.timestamps
    end
  end
end
