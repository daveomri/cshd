require 'test_helper'

class InteractionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @interaction = interactions(:one)
  end

  test 'should get index' do
    get interactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_interaction_url
    assert_response :success
  end

  test 'should create interaction' do
    assert_difference('Interaction.count') do
      post interactions_url, params: { interaction: { name: @interaction.name } }
    end

    assert_redirected_to interaction_url(Interaction.last)
  end

  test 'should show interaction' do
    get interaction_url(@interaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_interaction_url(@interaction)
    assert_response :success
  end

  test 'should update interaction' do
    patch interaction_url(@interaction), params: { interaction: { name: @interaction.name } }
    assert_redirected_to interaction_url(@interaction)
  end

  test 'should destroy interaction' do
    assert_difference('Interaction.count', -1) do
      delete interaction_url(@interaction)
    end

    assert_redirected_to interactions_url
  end
end
