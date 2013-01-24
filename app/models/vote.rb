class Vote < ActiveRecord::Base
  attr_accessible :choice_id, :content, :user_id
  belongs_to :choice
  belongs_to :user
end
