Rails.application.routes.draw do
  devise_for :users

    resources :recipes  do
        resources :comments, only: [:create, :edit, :update, :destroy]
      end

  root 'recipes#index'

  get 'my_recipes' => 'recipes#my_recipes'

  get 'user_recipes' => 'recipes#user_recipes'

  get 'recipes/show'

  get 'recipes/edit'

end
