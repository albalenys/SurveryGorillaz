class Survey < ActiveRecord::Base
  has_many :questions
  has_many :question_responses
  belongs_to :user

  validates_presence_of :title
end
