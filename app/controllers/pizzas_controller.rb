class PizzasController < ApplicationController
  before_action :set_pizza, only: [:show, :edit, :update, :destroy]
  before_filter :has_permission, except: [:index, :show]

  # GET /pizzas
  # GET /pizzas.json
  
    def set_action_menu
      @menu_name = @menuNames[:pizzas]
    end

  def has_permission
    if @user.privilege.level < 100
      session[:error] = 'interdit'
      redirect_to ({controller: :home, action: :banned})
    end
  end

  def search
    @side_action = @actionNames[:search_pizza]
  end

  def index
    @pizzas = Pizza.all
    @side_action = @actionNames[:show_pizzas]
    @disp_card = false
  end

  # GET /pizzas/1
  # GET /pizzas/1.json
  def show
  end

  # GET /pizzas/new
  def new
    @pizza = Pizza.new
    @pizza.is_proposed = true
    @side_action = @actionNames[:new_pizza]
    @title_part = 'Création de pizza'
    @ingredients = Ingredient.all
  end

  # GET /pizzas/1/edit
  def edit
    @title_part = 'Modification pizza'
    @ingredients = Ingredient.all
  end

  # POST /pizzas
  # POST /pizzas.json
  def create
    @pizza = Pizza.new(pizza_params)
    ingredients_from_params(params);

    respond_to do |format|
      if @pizza.save
        format.html { redirect_to action: :index}
        format.json { render :show, status: :created, location: @pizza }
      else
        format.html { render :new }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pizzas/1
  # PATCH/PUT /pizzas/1.json
  def update
    respond_to do |format|

      @pizza.name = pizza_params[:name]
      @pizza.is_proposed = pizza_params[:is_proposed]
      ingredients_from_params(params);

      if @pizza.save
        format.html { redirect_to action: :index, notice: 'Pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @pizza }
      else
        format.html { render :edit }
        format.json { render json: @pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pizzas/1
  # DELETE /pizzas/1.json
  def destroy
    @pizza.destroy
    respond_to do |format|
      format.html { redirect_to pizzas_url, notice: 'Pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pizza
      @pizza = Pizza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pizza_params
      params.require(:pizza).permit(:name, :is_proposed, :ingredients)
    end

    def ingredients_from_params(p)
      ingredients = Array.new

      if p[:ingredients] != nil || !params[:ingredients].to_s.empty?
        p[:ingredients].split(',').each do |i_name|
          ingredient = Ingredient.find_by(name: i_name)
          if(ingredient != nil)
            ingredients << ingredient
          end
        end
      end
      @pizza.ingredients = ingredients
    end
end
