class AddIndexToReviews < ActiveRecord::Migration
  def change
    add_index(:reviews, :documentary_id)
    add_index(:reviews, :reviewer_id)
  end
end
