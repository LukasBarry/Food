class AddDetailsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :rating1, :integer
    add_column :comments, :rating2, :integer
    add_column :comments, :rating3, :integer
    add_column :comments, :rating4, :integer
    add_column :comments, :ratng5, :integer
  end
end
