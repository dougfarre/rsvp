Rsvp::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} 

  devise_for :admins

  resources :addresses

  resources :invitations

	match '/registry', :to => 'home#registry', :as => 'registry'
	match '/itinerary', :to => 'home#itinerary', :as => 'itinerary'
	match '/accommodations', :to => 'home#accommodations', :as => 'accommodations'
	match '/venue', :to => 'home#venue', :as => 'venue'

	match '/dashboard', :to => 'dashboard#main', :as => 'dashboard'
	match '/admin_index', :to => 'invitations#admin_index', :as => 'admin_index'
	match '/thankyou', :to => 'invitations#thankyou', :as => 'thankyou'
	match '/thankyou_gift', :to => 'home#thankyou'

  root :to => "home#index"
end
