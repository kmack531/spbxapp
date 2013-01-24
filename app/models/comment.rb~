class Comment < ActiveRecord::Base
  attr_accessible :choice_id, :content, :user_id
  belongs_to :choice
  belongs_to :user
  has_many :likes, dependent: :destroy 
  has_many :dislikes, dependent: :destroy 

  #validates :content, presence: true
end
