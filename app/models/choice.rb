class Choice < ActiveRecord::Base
  attr_accessible :content, :question_id, :description
  belongs_to :question
  has_many :votes
  has_many :comments
end
