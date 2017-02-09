class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email_for_index, null: false         #索引用メールアドレス
      t.string :name, null: false                    #お客様名
      t.string :name_kana                            #お客様名前かな
      t.string :hashed_password                      #パスワード
      t.string :image_url                            #写真のurl
      t.string :instagram_url                        #インスタグラムのユーザページ
      t.string :instagram_name                       #インスタグラムのユーザ名
      t.string :facebook_url
      t.string :facebook_name
      t.string :twitter_url
      t.string :twitter_name

      t.timestamps
    end

    add_index :customers, :email_for_index, unique:true
    add_index :customers, :name_kana

  end
end
