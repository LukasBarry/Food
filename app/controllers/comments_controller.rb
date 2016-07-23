class CommentsController < ApplicationController

  def create
  @comment = Comment.create(comment_params)
  respond_to do |format|
    if @comment.save
      format.html{redirect_to recipe_path(@comment.recipe_id), notice: "Comment was successfully created"}
    else
      format.html {redirect_to recipes_path}
    end
  end
end

def edit
  @recipe = Recipe.find(params[:recipe_id])
  @comment = Comment.find(params[:id])
end

def update
  @comment = Comment.find(params[:id])
  respond_to do |format|
    if @comment.update(comment_params)
      format.html{redirect_to recipe_path( @comment.recipe_id), notice: 'Comment was successfully created.'}
    else
      format.html { redirect_to recipes_path}
    end
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  respond_to do |format|
    format.html { redirect_to recipe_path(@comment.recipe), notice: 'Comment was successfully destroyed.' }
  end
end

private

def comment_params
  params.require(:comment).permit(:comment_entry, :recipe_id, :user_id, :rating1, :rating2, :rating3, :rating4, :rating5)
end



end
