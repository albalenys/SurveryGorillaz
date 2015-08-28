class QuestionResponse < ActiveRecord::Base
  has_many :choices
  has_many :questions
  has_many :surveys
  has_many :users
end
