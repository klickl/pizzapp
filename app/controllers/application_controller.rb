class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :define_user
  before_filter :define_names
  before_filter :set_action_menu
  #before_filter :require_login, :define_user

  def logged?
    session[:user_id] == nil ? false : true
  end

  def define_user
    #Define automatically the global @user
    #@user = User.find_by(id: session[:user_id])
    @user = User.find_by(id: 1)
    session[:user_id] = @user
    @notifications = nil
    if @user.is_notified?
      @notifications  = @user.notifications
    else
      @notifications = nil
    end
  end

  def define_names
    @side_action = ''
    @menu_name = ''

    @actionNames = Hash.new
    @menuNames = Hash.new

    @actionNames[:show_pizzas] = 'show_pizza'
    @actionNames[:search_pizza] = 'search_pizza'
    @actionNames[:new_pizza] = 'new_pizza'
    @actionNames[:new_ingredient] = 'new_ingredient'
    @actionNames[:show_ingredients] = 'show_ingredients'

    @actionNames[:show_restaurants] = 'show_restaurants'

    @menuNames[:pizzas] = 'pizzas'
    @menuNames[:restaurants] = 'restaurants'
    @menuNames[:orders] = 'orders'
    @menuNames[:users] = 'users'
    @menuNames[:my_groups] = 'my_groups'
    @menuNames[:groups] = 'groups'
    @menuNames[:ingredients] = 'ingredients'

    #@notifications = ''

    @disp_card = true
  end

  def app_name
    'GroupOrder'
  end

  private
  def require_login
    unless logged?
      flash[:notice] = 'Authentification nécessaire !'
      redirect_to controller: 'login', action: 'login'
    end
  end
end
