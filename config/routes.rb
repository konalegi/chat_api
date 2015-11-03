ChatApi::Application.routes.draw do
  # Api definition"
  namespace :api, defaults: { format: :json }, path: '/' do
    scope module: :v1 do
      scope module: :chats do
        resources :chats, only: [:index, :create, :show]
      end
    end
  end
end
