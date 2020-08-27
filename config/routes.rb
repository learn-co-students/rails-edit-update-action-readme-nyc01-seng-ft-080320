Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new, :create]#adding [:edit, :update] would do the same as the lines below. 
  get 'articles/:id/edit', to: 'articles#edit', as: :edit_article #get route for edit form. the form needs to know which record in particular is being edited. So, the route must be dynamic and accept an :id as a parameter that can be accessed by the controller
  patch 'articles/:id', to: 'articles#update' #this route handles the update action. It accepts the same :id parameter as the edit form above (so it updates the same record that was edited)
end

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html