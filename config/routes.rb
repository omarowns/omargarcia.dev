Rails.application.routes.draw do

  get 'authenticables/destroy'
  constraints(lambda { |request| request.domain.match?(/^omargarcia(\.mx|\-mx\.local)$/) }) do
    root 'pages#index', as: 'mx_root'
  end

  constraints(lambda { |request| request.domain.match?(/^omargarcia(\.dev|\-dev\.local)$/) }) do
    root 'pages#tech', as: 'dev_root'
  end

  if Rails.env.test?
    get '/mx_root', to: 'pages#index', as: 'test_mx_root'
    get '/dev_root', to: 'pages#tech', as: 'test_dev_root'
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

        resources :users, except: [:edit, :destroy] do
          get :edit, to: 'users/registrations#edit'
          resources :authenticables, only: :destroy, shallow: true
        end

        resources :about_lines, only: [:index, :new, :create]
        resources :interests, only: [:index, :new, :create]
        resources :works, only: [:index, :new, :create]

        resources :abouts do
          resources :about_lines, shallow: true
          resources :image_proxies, only: [:index, :new]
        end

        resources :location_groups do
          resources :location_proxies, only: [:index, :new]
          resources :image_proxies, only: [:index, :new]
        end

        resources :location_proxies

        resources :locations do
          resources :location_proxies, only: [:index, :new]
          resources :image_proxies, only: [:index, :new]
        end

        resources :image_proxies

        resources :images do
          resources :location_proxies, only: [:index, :new]
          resources :image_proxies, only: [:index, :new]
        end

        resources :interest_groups do
          resources :interests, shallow: true
          resources :image_proxies, only: [:index, :new]
        end

        resources :profiles do
          resources :image_proxies, only: [:index, :new]
        end

        resources :work_groups do
          resources :works, shallow: true
          resources :image_proxies, only: [:index, :new]
        end

        resources :works, only: [] do
          resources :location_proxies, only: [:index, :new]
          resources :image_proxies, only: [:index, :new]
        end
      end
    end
  end
end
