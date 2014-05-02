class AddCategoryToDocumentaries < ActiveRecord::Migration
  def change
    change_table :documentaries do |t|
      t.string :category
    end
  end
end
