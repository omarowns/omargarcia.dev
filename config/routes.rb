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

  namespace :admin do
    resources :profiles
    resources :abouts
  end
end
