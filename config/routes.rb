Rails.application.routes.draw do
  resources :songs, only: [:index,:new, :create, :show]
  get 'songs/:id/edit', to: 'songs#edit', as: :edit_song
  patch 'songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'
  
  root 'songs#index'
end


  