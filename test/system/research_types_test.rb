require "application_system_test_case"

class ResearchTypesTest < ApplicationSystemTestCase
  setup do
    @research_type = research_types(:one)
  end

  test "visiting the index" do
    visit research_types_url
    assert_selector "h1", text: "Research types"
  end

  test "should create research type" do
    visit research_types_url
    click_on "New research type"

    fill_in "Allowed per year", with: @research_type.allowed_per_year
    fill_in "Fund", with: @research_type.fund
    fill_in "Gender", with: @research_type.gender
    fill_in "Name", with: @research_type.name
    check "Theme based" if @research_type.theme_based
    click_on "Create Research type"

    assert_text "Research type was successfully created"
    click_on "Back"
  end

  test "should update Research type" do
    visit research_type_url(@research_type)
    click_on "Edit this research type", match: :first

    fill_in "Allowed per year", with: @research_type.allowed_per_year
    fill_in "Fund", with: @research_type.fund
    fill_in "Gender", with: @research_type.gender
    fill_in "Name", with: @research_type.name
    check "Theme based" if @research_type.theme_based
    click_on "Update Research type"

    assert_text "Research type was successfully updated"
    click_on "Back"
  end

  test "should destroy Research type" do
    visit research_type_url(@research_type)
    click_on "Destroy this research type", match: :first

    assert_text "Research type was successfully destroyed"
  end
end
