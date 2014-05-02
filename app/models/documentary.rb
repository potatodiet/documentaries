class Documentary < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :video_source
  validates_presence_of :video_service
  validates_presence_of :category

  validates_uniqueness_of :title
  validates_uniqueness_of :video_source

  # will_paginate setting
  self.per_page = 8
end
