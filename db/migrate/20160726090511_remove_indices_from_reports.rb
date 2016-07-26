class RemoveIndicesFromReports < ActiveRecord::Migration
  def up
    remove_index :reports, :review_id if index_exists?(:reports, :review_id)
    remove_index :reports, :user_id if index_exists?(:reports, :user_id)
  end

  def down
    add_index :reports, :review_id unless index_exists?(:reports, :review_id)
    add_index :reports, :user_id unless index_exists?(:reports, :user_id)
  end
end
