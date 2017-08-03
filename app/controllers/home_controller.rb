class HomeController < ApplicationController
	def index
		@links = {'latestOrders' => 'Commandes', 'latestDelivers' => 'Livraisons'}
	end
	def set_action_menu
		@menu_name = ''
	end
	def banned
		if session[:error] == nil
			redirect_to action: :index
		else
			@error_auth = true
			session[:error] = nil
		end
	end
end
