class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :display_name
      t.integer :age
      t.text :bio
      t.string :gender
      t.string :looking_for, length: 4
      t.string :zip_code

      t.timestamps
    end
  end
end
