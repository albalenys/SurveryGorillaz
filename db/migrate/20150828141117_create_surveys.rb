class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title, null: false, limit: 100
      t.belongs_to :user, null: false

      t.timestamps(null: false)
    end
  end
end
