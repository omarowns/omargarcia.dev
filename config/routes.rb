require 'sidekiq/web'

Rails.application.routes.draw do
  # public facing routes
  scope "(:locale)", locale: /en|es/ do
    root 'pages#index'
    get '/about', to: 'pages#about', as: 'about_me'
    get '/contact', to: 'pages#contact', as: 'contact_me'
  end

  get 'authenticables/destroy'

  devise_for :users,
             path: 'auth',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations',
               passwords: 'users/passwords',
               omniauth_callbacks: 'users/omniauth_callbacks',
             }

  devise_scope :user do
    scope '/admin' do
      root 'profiles#index', as: :authenticated_user_root

      resources :feature_flags

      resources :users, except: [:edit, :destroy] do
        get :edit, to: 'users/registrations#edit'
        resources :authenticables, only: :destroy, shallow: true
      end

      resources :profiles do
        resources :sections, only: [:index, :new]
        resources :image_proxies, only: [:index, :new]
      end

      resources :sections

      resources :image_proxies

      resources :images do
        resources :image_proxies, only: [:index, :new]
      end

      resources :impressions, only: [:index, :show]
      resources :analytics, only: [:index]
      resources :graphs, only: [] do
        get :impressions, on: :collection
      end

      resources :conversations do
        resources :posts
      end
      resources :contacts

      mount Sidekiq::Web, at: '/sidekiq'
    end
  end

  direct :cratebind_homepage do
    'https://www.cratebind.com/'
  end

  direct :magmalabs_homepage do
    'https://www.magmalabs.io/'
  end

  direct :agencymvp_homepage do
    'https://www.agencymvp.com/'
  end

  direct :github_oauth_settings do
    "https://github.com/settings/connections/applications/#{Rails.application.credentials.github[:client_id]}"
  end

  direct :spotify_oauth_settings do
    'https://www.spotify.com/account/apps/'
  end

  direct :twitter_oauth_settings do
    "https://twitter.com/settings/applications/#{Rails.application.credentials.twitter[:app_id]}"
  end

  direct :twitter_profile_status do
    'https://twitter.com/omarowns/status/'
  end
end
