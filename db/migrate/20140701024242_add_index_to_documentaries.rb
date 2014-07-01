class AddIndexToDocumentaries < ActiveRecord::Migration
  def change
    add_index(:documentaries, :uploader_id)
  end
end
