class RecipesController < ApplicationController
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]

    def my_recipes

    end

    def user_recipes
      @user = User.find(params[:id])
    end
    # GET /recipes
    # GET /recipes.json
    def index
      @recipes = Recipe.all
    end
    # GET /recipes/1
    # GET /recipes/1.json
    def show
      @comment = Comment.new
    end

    # GET /recipes/new
    def new
      @recipe = Recipe.new
    end

    # GET /recipes/1/edit
    def edit
    end

    # POST /recipes
    # POST /recipes.json
    def create
      @recipe = Recipe.new(recipe_params)

        if @recipe.save
          redirect_to @recipe, notice: 'Recipe was successfully created.'
        else
          render :new
      end
    end

    # PATCH/PUT /recipes/1
    # PATCH/PUT /recipes/1.json
    def update
        if @recipe.update(recipe_params)
          redirect_to @recipe, notice: 'Delicious.'
        else
           render :edit
        end
    end

    # DELETE /recipes/1
    # DELETE /recipes/1.json
    def destroy
      @recipe.destroy
       redirect_to recipes_url, notice: 'Uneaten.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_recipe
        @recipe = Recipe.find(params[:id])
      end
      # Never trust parameters from the scary internet, only allow the white list through.
      def recipe_params
        params.require(:recipe).permit(:title, :category,  :recipe_ingredients, :avatar, :recipe_instructions, :user_id, :remove_avatar, :average_rating)
      end
  end
