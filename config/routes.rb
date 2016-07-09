Rails.application.routes.draw do
  get 'relationships/follow_user'

  get 'relationships/unfollow_user'

  devise_for :users , :controllers => { registrations: 'registrations',omniauth_callbacks: 'omniauth_callbacks' }
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup 
  get '/users/:uname/profile'=>'user_profile#profile'

  patch '/user_profile/savename/:id'=>'user_profile#savename'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   get '/home/index'=>"home#index"
   root 'home#index'
    namespace :admin do
       root :to => "home#index"
      resources :interests 
      resources :roles
      resources :clubs 
      resources :roles_users
      resources :rating_categories

  end  

  get '/interest'=>'user_interests#interest'
  post '/user_interest/apply/(.:format)'=>'user_interests#apply'
  resources :user_clubs,          only: [:create, :destroy]
  get '/clubs/:id/:name'=>'clubs#show'
  get '/clubs/:id/:name/get_club_page'=>'clubs#get_club_page'
  
  get '/club_question/:id/getclubquestions'=>'club_questions#getclubquestions'
  get '/club_story/:id/getclubstories'=>'club_stories#getclubstories'
  
  get '/clubs/:id/:name/getclubmember'=>'clubs#getclubmember'

  get '/clubs/:id/:name/questions'=>'clubs#questions'
  get '/clubs/:id/:name/stories'=>'clubs#stories'

  
  get '/clubs/:id/:name/questions/:qid/:ques'=>'clubs#showquestions'
  get '/clubs/:id/:name/stories/:sid/:story'=>'clubs#showstories'
  resources :club_questions, only: [ :create, :destroy]
  resources :club_questions do
     member do
        put "like", to: "club_questions#upvote"
        put "dislike", to: "club_questions#downvote"
    end
  end

  resources :club_stories, only: [:create, :destroy]
  resources :answers, only: [:create, :destroy]
  resources :story_comments, only: [:create, :destroy]

  patch '/story_ratings/rate'=>'story_ratings#rate'

  get '/clubs/:id/:name/get_user_club_page'=>'clubs#get_user_club_page'
  get '/club_question/:id/getuserclubquestions'=>'club_questions#getuserclubquestions'
  get '/club_story/:id/getuserclubstories'=>'club_stories#getuserclubstories'
  get '/user_club/:id/getuserclubs'=>'user_clubs#getuserclubs'



  #-----------------follow and unfollow user-------------------------

  post '/:uname/follow_user', to: 'relationships#follow_user', as: :follow_user
  post '/:uname/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user


  get '/users/:uname/getfollower'=>'user_profile#getfollower'
  get '/users/:uname/getfollowing'=>'user_profile#getfollowing'


  get 'club/:id/:cname/story/:sid/:stitle'=>'club_stories#story'

  get 'club/:id/:cname/question/:qid/:question'=>'club_questions#question'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  
  #get '*path' => redirect('/')
end
