require 'test_helper'

class Customer::AddDeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_add_deliveries_index_url
    assert_response :success
  end

  test "should get create" do
    get customer_add_deliveries_create_url
    assert_response :success
  end

  test "should get destroy" do
    get customer_add_deliveries_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get customer_add_deliveries_edit_url
    assert_response :success
  end

  test "should get update" do
    get customer_add_deliveries_update_url
    assert_response :success
  end

end
