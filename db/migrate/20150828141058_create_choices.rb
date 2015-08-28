class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content, null: false
      t.belongs_to :question, null: false # this is interesting. Hope it works!

      t.timestamps(null: false)
    end
  end
end
