class AddVideoServiceToDocumentaries < ActiveRecord::Migration
  def change
    change_table :documentaries do |t|
      t.string :video_service
    end
  end
end
