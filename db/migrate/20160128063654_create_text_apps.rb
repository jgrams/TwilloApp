class CreateTextApps < ActiveRecord::Migration
  def change
    create_table :text_apps do |t|
      t.string :phone_num
      t.string :name

      t.timestamps null: false
    end
  end
end
