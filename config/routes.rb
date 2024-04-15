Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :usuarios
  post 'login', to: 'autenticacoes#login'

  namespace :api do 
    namespace :v1 do 
      resources :montagens
      
      get '/get_processadores', to: 'componentes#get_processadores'
      get '/get_placas_mae', to: 'componentes#get_placas_mae'
      get '/get_memorias_ram', to: 'componentes#get_memorias_ram'
      get '/get_placas_de_video', to: 'componentes#get_placas_de_video'
    end
  end
end
