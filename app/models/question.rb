class Question < ActiveRecord::Base
  attr_accessible :content, :user_id, :choices_attributes
  belongs_to :user
  has_many :choices
  accepts_nested_attributes_for :choices

  default_scope order: 'questions.created_at DESC'
end
