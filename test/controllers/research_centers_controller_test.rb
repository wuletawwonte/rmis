require "test_helper"

class ResearchCentersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get research_centers_index_url
    assert_response :success
  end

  test "should get show" do
    get research_centers_show_url
    assert_response :success
  end

  test "should get create" do
    get research_centers_create_url
    assert_response :success
  end

  test "should get new" do
    get research_centers_new_url
    assert_response :success
  end

  test "should get edit" do
    get research_centers_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get research_centers_destroy_url
    assert_response :success
  end
end
