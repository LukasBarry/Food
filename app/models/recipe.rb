class Recipe < ActiveRecord::Base
 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>", :preserve_files => "false" }, :default_url => "/images/:style/missing.png"

 attr_accessor :remove_avatar
 before_validation { avatar.clear if remove_avatar == '1' }

 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 has_many :comments
 belongs_to :user

  def average_rating
    ratings =[0]
    self.comments.each do |comment|
      unless comment.recipe_rating == 0
        ratings << comment.recipe_rating
      end
    end
    sum = ratings.reduce(:+)
    average_rating = sum / (ratings.count)
  end
end
