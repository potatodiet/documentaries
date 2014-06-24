class AddTimestamptsToReviews < ActiveRecord::Migration
  def change
    change_table(:reviews) do |t|
      t.timestamps
    end
  end
end
