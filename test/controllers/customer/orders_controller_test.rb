require 'test_helper'

class Customer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get customer_orders_new_url
    assert_response :success
  end

  test "should get show" do
    get customer_orders_show_url
    assert_response :success
  end

  test "should get create" do
    get customer_orders_create_url
    assert_response :success
  end

  test "should get completion" do
    get customer_orders_completion_url
    assert_response :success
  end

  test "should get index" do
    get customer_orders_index_url
    assert_response :success
  end

  test "should get about" do
    get customer_orders_about_url
    assert_response :success
  end

end
