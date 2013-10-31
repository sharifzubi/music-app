class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :track

  attr_accessible :user_id, :text, :flagged

end
