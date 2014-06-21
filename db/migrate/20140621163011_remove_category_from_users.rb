class RemoveCategoryFromUsers < ActiveRecord::Migration
  def change
    change_table(:documentaries) do |t|
      t.remove(:category)
    end
  end
end
