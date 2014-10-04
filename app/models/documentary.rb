class Documentary < ActiveRecord::Base
  attr_reader(:select_list)

  belongs_to(:uploader, class_name: "User")
  has_many(:reviews, foreign_key: "documentary_id")

  validates_presence_of(:title)
  validates_presence_of(:description)
  validates_presence_of(:video_source)
  validates_presence_of(:video_service)
  validates_presence_of(:tag_list)

  validates_uniqueness_of(:title)
  validates_uniqueness_of(:video_source)

  after_initialize(:create_arrays)

  before_save(:defaults)
  before_save(:create_thumbnail)

  acts_as_taggable_on(:tags)

  # will_paginate setting
  self.per_page = 8

  def create_arrays
    @select_list = ["youtube"]
  end

  def defaults
    self.likes ||= 0
    self.dislikes ||= 0
    self.total_rating ||= 0;
  end

  def create_thumbnail
    self.thumbnail_url = "https://img.youtube.com/vi/#{video_source}/mqdefault.jpg"
  end
end
