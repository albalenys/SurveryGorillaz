class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :survey
  has_many :question_responses
  validates_presence_of :content
end
