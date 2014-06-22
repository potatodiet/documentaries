class AddTimestampsToDocumentaries < ActiveRecord::Migration
  def change
    change_table(:documentaries) do |t|
      t.timestamps
    end
  end
end
