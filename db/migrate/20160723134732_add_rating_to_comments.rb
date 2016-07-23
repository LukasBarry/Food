class AddRatingToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rating5, :integer
  end
end
