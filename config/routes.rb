Rails.application.routes.draw do
  # root 'pages#index'

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

  scope '/admin' do
    resources :profile_images, only: [:index, :new, :create]
    resources :profiles do
      resources :profile_images, shallow: true
    end

    resources :about_lines, only: [:index, :new, :create]
    resources :abouts do
      resources :about_lines, shallow: true
    end

    resources :works, only: [:index, :new, :create]
    resources :work_groups do
      resources :works, shallow: true
    end

    resources :interests, only: [:index, :new, :create]
    resources :interest_groups do
      resources :interests, shallow: true
    end


    resources :location_proxies, only: [:index, :new, :create]
    resources :location_groups do
      resources :location_proxies, shallow: true
    end

    resources :locations
    resources :images
  end
end
