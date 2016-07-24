class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :recipes
  has_many :comments

  def my_recipes
    @my_recipes = Recipe.find(:user_id)
  end

end
