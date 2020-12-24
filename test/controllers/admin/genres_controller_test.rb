require 'test_helper'

class Admin::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_genres_create_url
    assert_response :success
  end

  test "should get show" do
    get admin_genres_show_url
    assert_response :success
  end

  test "should get upadate" do
    get admin_genres_upadate_url
    assert_response :success
  end

  test "should get edit" do
    get admin_genres_edit_url
    assert_response :success
  end

end
