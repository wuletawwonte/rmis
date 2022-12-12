require "application_system_test_case"

class GeneralSettingsTest < ApplicationSystemTestCase
  setup do
    @general_setting = general_settings(:one)
  end

  test "visiting the index" do
    visit general_settings_url
    assert_selector "h1", text: "General settings"
  end

  test "should create general setting" do
    visit general_settings_url
    click_on "New general setting"

    click_on "Create General setting"

    assert_text "General setting was successfully created"
    click_on "Back"
  end

  test "should update General setting" do
    visit general_setting_url(@general_setting)
    click_on "Edit this general setting", match: :first

    click_on "Update General setting"

    assert_text "General setting was successfully updated"
    click_on "Back"
  end

  test "should destroy General setting" do
    visit general_setting_url(@general_setting)
    click_on "Destroy this general setting", match: :first

    assert_text "General setting was successfully destroyed"
  end
end
