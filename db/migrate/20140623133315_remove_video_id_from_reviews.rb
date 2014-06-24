class RemoveVideoIdFromReviews < ActiveRecord::Migration
  def change
    change_table(:reviews) do |t|
      t.remove(:video_id)
    end
  end
end
