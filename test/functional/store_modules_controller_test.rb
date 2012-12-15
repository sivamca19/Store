require 'test_helper'

class StoreModulesControllerTest < ActionController::TestCase
  setup do
    @store_module = store_modules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:store_modules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create store_module" do
    assert_difference('StoreModule.count') do
      post :create, store_module: { name: @store_module.name }
    end

    assert_redirected_to store_module_path(assigns(:store_module))
  end

  test "should show store_module" do
    get :show, id: @store_module
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @store_module
    assert_response :success
  end

  test "should update store_module" do
    put :update, id: @store_module, store_module: { name: @store_module.name }
    assert_redirected_to store_module_path(assigns(:store_module))
  end

  test "should destroy store_module" do
    assert_difference('StoreModule.count', -1) do
      delete :destroy, id: @store_module
    end

    assert_redirected_to store_modules_path
  end
end
