Rails.application.routes.draw do
  devise_for :users
  # deviseを使用する際にURLとしてuserを含む
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root'post_images#index'

  resources :post_images, only: [:new, :create, :index, :show] do
  	resource :favorites,only:[:create,:destroy]
  	resource :post_comments,only: [:create,:destroy]
  	# (resource)単数にすると、そのコントローラのidがリクエストに含まれない
  	# コメントの詳細ページは作成しない。つまりshowページ不要でidの受け渡しも不要のため
  end

end
