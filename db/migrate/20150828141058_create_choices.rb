class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :content, null: false
      t.belongs_to :question, null: false

      t.timestamps(null: false)
    end
  end
end
