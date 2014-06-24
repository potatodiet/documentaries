class CreateProperRelationships < ActiveRecord::Migration
  def change
    change_table(:documentaries) do |t|
      t.integer(:uploader_id)

      t.remove(:uploader_user)
    end

    change_table(:reviews) do |t|
      t.integer(:reviewer_id)
      t.integer(:video_id)
      
      t.remove(:user_id)
    end
  end
end
