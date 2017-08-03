require 'test_helper'

class CompositionPizzasControllerTest < ActionController::TestCase
  setup do
    @composition_pizza = composition_pizzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:composition_pizzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create composition_pizza" do
    assert_difference('CompositionPizza.count') do
      post :create, composition_pizza: {  }
    end

    assert_redirected_to composition_pizza_path(assigns(:composition_pizza))
  end

  test "should show composition_pizza" do
    get :show, id: @composition_pizza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @composition_pizza
    assert_response :success
  end

  test "should update composition_pizza" do
    patch :update, id: @composition_pizza, composition_pizza: {  }
    assert_redirected_to composition_pizza_path(assigns(:composition_pizza))
  end

  test "should destroy composition_pizza" do
    assert_difference('CompositionPizza.count', -1) do
      delete :destroy, id: @composition_pizza
    end

    assert_redirected_to composition_pizzas_path
  end
end
