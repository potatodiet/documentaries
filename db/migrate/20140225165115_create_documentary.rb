class CreateDocumentary < ActiveRecord::Migration
  def change
    create_table :documentaries do |t|
      t.string :title
      t.text :description
      t.string :video_source
      t.integer :uploader_user
      t.integer :likes
      t.integer :dislikes
    end
  end
end
