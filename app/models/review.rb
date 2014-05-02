class Review < ActiveRecord::Base
  validates_presence_of :message
  validates_presence_of :is_positive
  validates_presence_of :documentary_id
end
