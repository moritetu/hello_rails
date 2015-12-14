Rails.application.routes.draw do
  
  resources :blogs do
    resources :entries, except: [:index]
  end

  resources :entries, only: [] do
    resources :comments, only: [:create, :destroy]
    patch '/comments/:id/approve' => 'comments#approve', as: 'comment_approve'
  end

  root to: 'blogs#index'
end
