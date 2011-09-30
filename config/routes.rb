Dj::Application.routes.draw do
  root :to => "playlist#index"

  resources :playlists, :controller => 'playlist' do
    collection do
      get :request
      get :search
    end
  end

end
