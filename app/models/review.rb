class Review < ActiveRecord::Base
  belongs_to(:documentary)
  belongs_to(:reviewer, :class_name => 'User')

  validates_presence_of(:message)
  validates_presence_of(:documentary_id)
end
