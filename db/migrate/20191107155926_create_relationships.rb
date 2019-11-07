class CreateRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :relationships do |t|
      t.integer :user_1_id
      t.integer :user_2_id
      t.boolean :pending, default: true

      t.timestamps
    end
  end
end
