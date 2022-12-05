require 'test_helper'

class AcademicRanksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @academic_rank = academic_ranks(:one)
  end

  test 'should get index' do
    get academic_ranks_url
    assert_response :success
  end

  test 'should get new' do
    get new_academic_rank_url
    assert_response :success
  end

  test 'should create academic_rank' do
    assert_difference('AcademicRank.count') do
      post academic_ranks_url,
           params: { academic_rank: { name: @academic_rank.name, order_key: @academic_rank.order_key } }
    end

    assert_redirected_to academic_rank_url(AcademicRank.last)
  end

  test 'should show academic_rank' do
    get academic_rank_url(@academic_rank)
    assert_response :success
  end

  test 'should get edit' do
    get edit_academic_rank_url(@academic_rank)
    assert_response :success
  end

  test 'should update academic_rank' do
    patch academic_rank_url(@academic_rank),
          params: { academic_rank: { name: @academic_rank.name, order_key: @academic_rank.order_key } }
    assert_redirected_to academic_rank_url(@academic_rank)
  end

  test 'should destroy academic_rank' do
    assert_difference('AcademicRank.count', -1) do
      delete academic_rank_url(@academic_rank)
    end

    assert_redirected_to academic_ranks_url
  end
end
