require 'test_helper'

class SignupsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signup" do
    assert_difference('Signup.count') do
      post :create, :signup => { }
    end

    assert_redirected_to signup_path(assigns(:signup))
  end

  test "should show signup" do
    get :show, :id => signups(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => signups(:one).to_param
    assert_response :success
  end

  test "should update signup" do
    put :update, :id => signups(:one).to_param, :signup => { }
    assert_redirected_to signup_path(assigns(:signup))
  end

  test "should destroy signup" do
    assert_difference('Signup.count', -1) do
      delete :destroy, :id => signups(:one).to_param
    end

    assert_redirected_to signups_path
  end
end
