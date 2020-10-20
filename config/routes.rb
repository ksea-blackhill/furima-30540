Rails.application.routes.draw do
  #before_action :move_to_index, except: [:index]
  devise_for :users
  root to: 'items#index'








  #private

  #def move_to_index
    #unless user_signed_in?
      #redirect_to action: :index
    #end
  #end
end



