class RemoveRatingFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :ratng5, :integer
  end
end
