require 'test_helper'

class TextAppsControllerTest < ActionController::TestCase
  setup do
    @text_app = text_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:text_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create text_app" do
    assert_difference('TextApp.count') do
      post :create, text_app: { name: @text_app.name, phone_num: @text_app.phone_num }
    end

    assert_redirected_to text_app_path(assigns(:text_app))
  end

  test "should show text_app" do
    get :show, id: @text_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @text_app
    assert_response :success
  end

  test "should update text_app" do
    patch :update, id: @text_app, text_app: { name: @text_app.name, phone_num: @text_app.phone_num }
    assert_redirected_to text_app_path(assigns(:text_app))
  end

  test "should destroy text_app" do
    assert_difference('TextApp.count', -1) do
      delete :destroy, id: @text_app
    end

    assert_redirected_to text_apps_path
  end
end
