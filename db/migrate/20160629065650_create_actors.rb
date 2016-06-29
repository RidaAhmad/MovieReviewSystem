class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name, limit: 30, null: false
      t.text :bio
      t.string :gender, limit: 10, null: false

      t.timestamps null: false
    end
  end
end
