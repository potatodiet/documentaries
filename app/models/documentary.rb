class Documentary < ActiveRecord::Base
  attr_reader(:select_list, :category_list)

  validates_presence_of(:title)
  validates_presence_of(:description)
  validates_presence_of(:video_source)
  validates_presence_of(:video_service)
  validates_presence_of(:category)

  validates_uniqueness_of(:title)
  validates_uniqueness_of(:video_source)

  after_initialize(:create_arrays)

  # will_paginate setting
  self.per_page = 8

  def create_arrays
    @select_list = ['youtube']
    @category_list = ['Other', 'Rome', 'World War 2', 'World War 1']
  end
end
