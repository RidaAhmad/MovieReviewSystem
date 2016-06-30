class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.belongs_to :movie, index: true, null: false
      t.belongs_to :actor, index: true, null: false

      t.timestamps null: false
    end
  end
end
