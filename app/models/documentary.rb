class Documentary < ActiveRecord::Base
  validates_inclusion_of :video_service, :in => ['youtube'],
      :allow_nil => true
end
