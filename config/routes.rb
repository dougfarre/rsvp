Rsvp::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"} 

	devise_scope :user do
  	match "/registrations/list_invites" => "registrations#list"
  	match "/registrations/logon" => "registrations#create"
	end
  devise_for :admins

  resources :addresses

  resources :invitations

	match '/invitations/send_save_the_date', :to => 'invitations#send_save_the_date', :as => 'send_save_the_date'
	match '/registrations/list_invites', :to => 'registrations#list', :as => 'list_invites'
	match '/registrations/logon', :to => 'registrations#create', :as => 'login_to_invite'

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
