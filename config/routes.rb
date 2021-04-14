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
    resources :about_lines, only: [:index, :new, :create]
    resources :interests, only: [:index, :new, :create]
    resources :works, only: [:index, :new, :create]

    resources :abouts do
      resources :about_lines, shallow: true
      resources :image_proxies, only: [:index, :new]
    end

    resources :location_groups do
      resources :location_proxies
      resources :image_proxies, only: [:index, :new]
    end

    resources :location_proxies

    resources :locations do
      resources :location_proxies, only: [:index, :new]
      resources :image_proxies, only: [:index, :new]
    end

    resources :image_proxies

    resources :images do
      resources :location_proxies
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
      resources :location_proxies
      resources :image_proxies, only: [:index, :new]
    end
  end
end
