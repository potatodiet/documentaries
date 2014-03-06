class AddTotalRatingToDocumentaries < ActiveRecord::Migration
  def change
    change_table :documentaries do |t|
      t.integer :total_rating
    end
  end
end
