require 'test_helper'

class Customer::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get Orders" do
    get customer_customers_Orders_url
    assert_response :success
  end

  test "should get new" do
    get customer_customers_new_url
    assert_response :success
  end

  test "should get show" do
    get customer_customers_show_url
    assert_response :success
  end

  test "should get create" do
    get customer_customers_create_url
    assert_response :success
  end

  test "should get completion" do
    get customer_customers_completion_url
    assert_response :success
  end

  test "should get index" do
    get customer_customers_index_url
    assert_response :success
  end

  test "should get about" do
    get customer_customers_about_url
    assert_response :success
  end

end
