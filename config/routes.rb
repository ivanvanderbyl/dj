Dj::Application.routes.draw do
  root :to => "playlist#index"

  resources :playlists, :controller => 'playlist' do
    collection do
      get :search
    end
  end

  resources :requests, :controller => 'playlist'

end
