class AddThumbnailUrlToDocumentaries < ActiveRecord::Migration
  def change
    change_table :documentaries do |t|
      t.string :thumbnail_url
    end
  end
end
