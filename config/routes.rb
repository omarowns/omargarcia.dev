Rails.application.routes.draw do
  root 'pages#index'
  get 'authenticables/destroy'
  get '/lnkdin', to: 'pages#lnkdin', as: 'lnkdin'

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
      unauthenticated :user do
        root 'users/sessions#new', as: :unauthenticated_user_root
        match '/:all', to: redirect('/auth/login'), via: :all
      end

      authenticated :user do
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

        resources :sections, except: [:index]

        resources :image_proxies

        resources :images do
          resources :image_proxies, only: [:index, :new]
        end
      end
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
