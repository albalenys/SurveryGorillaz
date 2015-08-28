class Choice < ActiveRecord::Base
  has_many :question_responses
  belongs_to :question
  validates_presence_of :content
end
