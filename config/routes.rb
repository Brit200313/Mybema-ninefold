Mybema::Application.routes.draw do
  require 'sidekiq/web'

  authenticate :admin do
    mount Sidekiq::Web => 'admin/sidekiq'
  end

  devise_for :admins
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'

  resources :articles, only: [:show]
  resources :discussions
  resources :discussion_categories, path: 'categories' do
    resources :discussions, only: :index
  end
  resources :discussion_comments
  resources :sections

  get 'profile' => 'users#profile'
  patch 'profile/update' => 'users#update_profile', as: :user

  #Search
  get 'search' => 'search#results', as: :search

  # Admin section
  get 'admin' => 'admin/overview#index'
  get 'admin/users' => 'admin/users#index'
  put 'admin/discussions/:id/toggle-visibility' => 'admin/discussions#toggle_visibility', as: :admin_toggle_discussion_visibility
  put 'admin/comments/:id/toggle-visibility' => 'admin/discussion_comments#toggle_visibility', as: :admin_toggle_comment_visibility

  scope :admin, module: 'admin' do
    resources :admins, only: [:index, :new, :create]
    resources :guidelines, only: [:index, :new, :create, :destroy], as: :guidelines
    resources :discussions, only: [:index, :edit, :update, :destroy], as: :admin_discussions
    resources :comments, only: [:index, :edit, :update, :destroy], as: :admin_comments, controller: 'discussion_comments'
    resources :sections, as: :admin_sections do
      resources :articles, except: [:index, :show]
    end
    resources :articles, only: :index, as: :admin_articles
  end
end