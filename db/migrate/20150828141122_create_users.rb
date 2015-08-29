class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password_digest, null: false
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :img_src

      t.timestamps(null: false)
    end
  end
end
