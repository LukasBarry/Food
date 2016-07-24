class Comment < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user




def recipe_rating
  recipe_rating =
    [rating1.to_i, rating2.to_i, rating3.to_i, rating4.to_i, rating5.to_i].reduce(:+)
end

end
