require 'application_system_test_case'

class AcademicRanksTest < ApplicationSystemTestCase
  setup do
    @academic_rank = academic_ranks(:one)
  end

  test 'visiting the index' do
    visit academic_ranks_url
    assert_selector 'h1', text: 'Academic ranks'
  end

  test 'should create academic rank' do
    visit academic_ranks_url
    click_on 'New academic rank'

    fill_in 'Name', with: @academic_rank.name
    fill_in 'Order key', with: @academic_rank.order_key
    click_on 'Create Academic rank'

    assert_text 'Academic rank was successfully created'
    click_on 'Back'
  end

  test 'should update Academic rank' do
    visit academic_rank_url(@academic_rank)
    click_on 'Edit this academic rank', match: :first

    fill_in 'Name', with: @academic_rank.name
    fill_in 'Order key', with: @academic_rank.order_key
    click_on 'Update Academic rank'

    assert_text 'Academic rank was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Academic rank' do
    visit academic_rank_url(@academic_rank)
    click_on 'Destroy this academic rank', match: :first

    assert_text 'Academic rank was successfully destroyed'
  end
end
