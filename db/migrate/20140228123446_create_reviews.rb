class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :message
      t.boolean :is_positive
      t.integer :user_id
      t.integer :documentary_id
    end
  end
end
