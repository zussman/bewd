require 'test_helper'

class HomesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get _form" do
    get :_form
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
