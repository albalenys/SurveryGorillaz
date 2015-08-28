class Choice < ActiveRecord::Base
  has_many :question_responses
  belongs_to :question
  validates_the_presence_of :content
end
