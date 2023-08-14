# frozen_string_literal: true

require 'application_system_test_case'

class EducationLevelsTest < ApplicationSystemTestCase
  setup do
    @education_level = education_levels(:one)
  end

  test 'visiting the index' do
    visit education_levels_url
    assert_selector 'h1', text: 'Education levels'
  end

  test 'should create education level' do
    visit education_levels_url
    click_on 'New education level'

    fill_in 'Name', with: @education_level.name
    fill_in 'Order key', with: @education_level.order_key
    click_on 'Create Education level'

    assert_text 'Education level was successfully created'
    click_on 'Back'
  end

  test 'should update Education level' do
    visit education_level_url(@education_level)
    click_on 'Edit this education level', match: :first

    fill_in 'Name', with: @education_level.name
    fill_in 'Order key', with: @education_level.order_key
    click_on 'Update Education level'

    assert_text 'Education level was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Education level' do
    visit education_level_url(@education_level)
    click_on 'Destroy this education level', match: :first

    assert_text 'Education level was successfully destroyed'
  end
end
