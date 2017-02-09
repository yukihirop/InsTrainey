class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :customer, null:false   #userと結びつくemail_idになる
      t.string :main, null:false
      t.string :sub_1, null:true
      t.string :sub_2, null:true

      t.timestamps
    end
  end
end
