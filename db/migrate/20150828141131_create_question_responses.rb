class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.belongs_to :choice, null: false
      t.belongs_to :question, null: false
      t.belongs_to :survey, null: false
      t.belongs_to :user, null: false

      t.timestamps(null: false)
    end
  end
end
