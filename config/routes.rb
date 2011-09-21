Dj::Application.routes.draw do
  root :to => "playlist#index"

  # resource :songs do
  #   collection do
  #     get :request
  #     get :search
  #   end
  # end
end
