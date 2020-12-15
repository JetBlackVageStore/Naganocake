require 'test_helper'

class Customer::IntoCartsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get customer_into_carts_update_url
    assert_response :success
  end

  test "should get index" do
    get customer_into_carts_index_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_into_carts_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get customer_into_carts_destroy_all_url
    assert_response :success
  end

  test "should get create" do
    get customer_into_carts_create_url
    assert_response :success
  end

end
