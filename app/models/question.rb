class Question < ActiveRecord::Base
  
  has_many :choices
  has_many :question_responses

  belongs_to :survey
  validates_presence_of :content
end
