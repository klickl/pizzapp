class CompositionPizzasController < ApplicationController
  before_action :set_composition_pizza, only: [:show, :edit, :update, :destroy]

  # GET /composition_pizzas
  # GET /composition_pizzas.json
  def index
    @composition_pizzas = CompositionPizza.all
  end

  # GET /composition_pizzas/1
  # GET /composition_pizzas/1.json
  def show
  end

  # GET /composition_pizzas/new
  def new
    @composition_pizza = CompositionPizza.new
  end

  # GET /composition_pizzas/1/edit
  def edit
  end

  # POST /composition_pizzas
  # POST /composition_pizzas.json
  def create
    @composition_pizza = CompositionPizza.new(composition_pizza_params)

    respond_to do |format|
      if @composition_pizza.save
        format.html { redirect_to @composition_pizza, notice: 'Composition pizza was successfully created.' }
        format.json { render :show, status: :created, location: @composition_pizza }
      else
        format.html { render :new }
        format.json { render json: @composition_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /composition_pizzas/1
  # PATCH/PUT /composition_pizzas/1.json
  def update
    respond_to do |format|
      if @composition_pizza.update(composition_pizza_params)
        format.html { redirect_to @composition_pizza, notice: 'Composition pizza was successfully updated.' }
        format.json { render :show, status: :ok, location: @composition_pizza }
      else
        format.html { render :edit }
        format.json { render json: @composition_pizza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /composition_pizzas/1
  # DELETE /composition_pizzas/1.json
  def destroy
    @composition_pizza.destroy
    respond_to do |format|
      format.html { redirect_to composition_pizzas_url, notice: 'Composition pizza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def list_pizza
    Pizza.all.collect {|p| [ p.name, p.id] }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_composition_pizza
      @composition_pizza = CompositionPizza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def composition_pizza_params
      params[:composition_pizza]
    end
end
